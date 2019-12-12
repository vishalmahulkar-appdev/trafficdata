namespace :import do
  desc "TODO"
  task locations: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("public", "data", "Location-20191205.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each do |row|
      
      if row["latitude"] != 0 && row["longitude"] != 0
        if Location.where( {:latitude => row["latitude"], :longitude => row["longitude"]} ).at(0) == nil
          loc = Location.new 
          loc.latitude = row["latitude"]
          loc.longitude = row["longitude"]
          loc.save
        end

        if SensorType.where( {:sensor_type => row["detector-type"]} ).at(0) == nil
          st = SensorType.new 
          st.sensor_type = row["detector-type"]
          st.save
        end

        if Lane.where( {:lane_name => row["lane-name"]} ).at(0) == nil
          l = Lane.new
          l.lane_name = row["lane-name"]
          l.lane_number = row["lane-id"]
          l.save
        end

        if Sensor.where( {:sensor_name => row["detector-Id"].chomp.gsub(" ","")} ).at(0) == nil 
          s = Sensor.new 
          s.type_id = SensorType.where( {:sensor_type => row["detector-type"]} ).at(0).id 
          s.latitude = row["latitude"].to_i/1000000.0
          s.longitude = row["longitude"].to_i/1000000.0
          s.location_id = Location.where( {:latitude => row["latitude"], :longitude => row["longitude"]} ).at(0).id
          s.sensor_name = row["detector-Id"].chomp.gsub(" ","")
          s.operational_status = true
          s.save 
        end
      end
    end
    puts "Sensor #{Sensor.count}, Location #{Location.count}, SensorTypes #{SensorType.count} saved"
  end

  task speeds: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("public", "data", "SpeedDataClean-20191205.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    counter = 0
    csv.each do |row|
      counter = counter + 1
      if counter > 152646

        
        thissensor = Sensor.where( {:sensor_name => row["detector-Id"].chomp.gsub(" ","") }).at(0)
        if thissensor == nil 
          puts row["detector-Id"]
        else 
          sp = LaneSpeed.new
          sp.time = row["local-time"]
          sp.lane_number = row["lane-Id"]
          sp.sensor_id = thissensor.id
          sp.speed = row["lane-speed"]
          sp.save

          ct = LaneCount.new
          ct.time = row["local-time"]
          ct.lane_number = row["lane-Id"]
          ct.sensor_id = thissensor.id
          ct.counts = row["lane-count"]
          ct.save
        end
        
        if LaneSpeed.count%100 == 0
          puts LaneSpeed.count.to_s
        end
      end
    end
  end
end
