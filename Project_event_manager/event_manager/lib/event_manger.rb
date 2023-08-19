require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'time'

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phonenumber(phonenumber)
    phonenumber.gsub!(/[\(\)\-\s\.]/, '')  # Remove parênteses, traços, espaços e pontos
  
    case phonenumber.length
    when 10
        phonenumber
    when 11
        if phonenumber.start_with?('1')
        phonenumber[0] = ''
        phonenumber
        else
        phonenumbe = nil
        end
    else
        phonenumbe = nil
    end
end

def find_peak_registration_hours(registration_data)
    registration_hours_count = Hash.new(0)
  
    registration_data.each do |reg_date|
      registration_hour = reg_date.hour
      registration_hours_count[registration_hour] += 1
    end
  
    peak_hours = registration_hours_count.select { |_, count| count == registration_hours_count.values.max }
  
    peak_hours.map do |hour, count|
      "Hour: #{hour}:00 - #{hour + 1}:00 | Registrations: #{count}"
    end
end

def find_peak_registration_days(registration_data)
    registration_days_count = Hash.new(0)
  
    registration_data.each do |reg_date|
      registration_day = reg_date.wday
      registration_days_count[registration_day] += 1
    end
  
    peak_days = registration_days_count.select { |_, count| count == registration_days_count.values.max }
  
    peak_days.map do |day, count|
      "Day: #{Date::DAYNAMES[day]} | Registrations: #{count}"
    end
end

def legislators_by_zipcode(zip)
    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  
    begin
      civic_info.representative_info_by_address(
        address: zip,
        levels: 'country',
        roles: ['legislatorUpperBody', 'legislatorLowerBody']
      ).officials
    rescue
      'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
    end
end

def save_thank_you_letter(id, form_letter)
  output_dir = File.expand_path('output', __dir__)
  Dir.mkdir(output_dir) unless Dir.exist?(output_dir)

  filename = File.join(output_dir, "thanks_#{id}.html")

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def save_peak_hours(peak_hours_info)
  output_dir = File.expand_path('output', __dir__)
  Dir.mkdir(output_dir) unless Dir.exist?(output_dir)

  filename = File.join(output_dir, 'peak_hours.txt')

  File.open(filename, 'w') do |file|
    peak_hours_info.each do |info|
      file.puts info
    end
  end
end

def save_peak_days(peak_day_info)
  output_dir = File.expand_path('output', __dir__)
  Dir.mkdir(output_dir) unless Dir.exist?(output_dir)

  filename = File.join(output_dir, 'peak_days.txt')

  File.open(filename, 'w') do |file|
    peak_day_info.each do |info|
      file.puts info
    end
  end
end


puts 'Event Manager Initialized!'

csv_file_name = 'Project_event_manager\event_attendees.csv'

contents = File.exist?(csv_file_name) ?
CSV.open(
    csv_file_name,
    headers: true,
    header_converters: :symbol
  ) 
 : 
 "Not encounter"

# "Look for a Solution before Building a Solution"

template_letter = File.read('Project_event_manager\form_letter.erb')
erb_template = ERB.new template_letter
registration_dates = []

contents.each do |row|
    id = row[0]
    name = row[:first_name]
    reg_date_str = row[:regdate]
    reg_date = Time.strptime(reg_date_str, '%m/%d/%y %H:%M')
    registration_dates << reg_date
    zipcode = clean_zipcode(row[:zipcode])
    phonenumber = clean_phonenumber(row[:homephone])
    legislators = legislators_by_zipcode(zipcode)
    
    form_letter = erb_template.result(binding)

    save_thank_you_letter(id,form_letter) 
end

peak_hour_info = find_peak_registration_hours(registration_dates)

peak_day_info = find_peak_registration_days(registration_dates)

save_peak_hours(peak_hour_info) 

save_peak_days(peak_day_info)

puts "Event Manager Finalized !"







