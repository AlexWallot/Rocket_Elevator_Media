namespace :db do
    desc "a new task to be executed"
    # not finished
    task :main do
        Rake::Task['db:fact_quote'].invoke
        Rake::Task['db:fact_contact'].invoke
        Rake::Task['db:fact_elevator'].invoke
        Rake::Task['db:dim_customer'].invoke
    end
    task :fact_quote do
        ActiveRecord::Base.establish_connection(:adapter  => "mysql2",:host => ENV["HOST_MYSQL"], :username => ENV["MYSQL_USERNAME"],:password => ENV["MYSQL_PASSWORD"],:database => ENV["MYSQL_DATABASE"])
        row = ActiveRecord::Base.connection.execute(ENV["FACT_QUOTE_QUERY"])
        ActiveRecord::Base.establish_connection(:adapter  => "postgresql",:host => ENV["HOST_POSTGRESQL"], :username => ENV["POSTGRESQL_USERNAME"],:password => ENV["POSTGRESQL_PASSWORD"],:database => ENV["POSTGRESQL_DATABASE"])
        row.each do |val|
            query = "INSERT INTO public.fact_quotes (\"quoteId\", creation_date, \"compagnyName\", email, \"nbElevator\") VALUES(#{val[0]},'#{val[1]}', '#{val[2].gsub("'","''")}', '#{val[3]}', #{val[4]});"
            ActiveRecord::Base.connection.execute(query)
        end
    end

    task :fact_contact do
        ActiveRecord::Base.establish_connection(:adapter  => "mysql2",:host => ENV["HOST_MYSQL"],:username => ENV["MYSQL_USERNAME"],:password => ENV["MYSQL_PASSWORD"],:database => ENV["MYSQL_DATABASE"])
        row = ActiveRecord::Base.connection.execute(ENV["FACT_CONTACT_QUERY"])
        ActiveRecord::Base.establish_connection(:adapter  => "postgresql",:host => ENV["HOST_POSTGRESQL"],:username => ENV["POSTGRESQL_USERNAME"],:password => ENV["POSTGRESQL_PASSWORD"],:database => ENV["POSTGRESQL_DATABASE"])
        row.each do |val|
            query = "INSERT INTO public.fact_contacts (\"contactId\", creation_date, \"compagnyName\", \"email\", \"nameProject\") VALUES(#{val[0]},'#{val[1]}', '#{val[2].gsub("'","''")}', '#{val[3]}', '#{val[4].gsub("'","''")}');"
            ActiveRecord::Base.connection.execute(query)
        end
    end

    task :fact_elevator do
        ActiveRecord::Base.establish_connection(:adapter  => "mysql2",:host => ENV["HOST_MYSQL"], :username => ENV["MYSQL_USERNAME"],:password => ENV["MYSQL_PASSWORD"], :database => ENV["MYSQL_DATABASE"])
        row = ActiveRecord::Base.connection.execute(ENV["FACT_ELEVATOR_QUERY"])
        ActiveRecord::Base.establish_connection(:adapter  => "postgresql",:host => ENV["HOST_POSTGRESQL"],:username => ENV["POSTGRESQL_USERNAME"],:password => ENV["POSTGRESQL_PASSWORD"],:database => ENV["POSTGRESQL_DATABASE"])
        row.each do |val|
            query = "INSERT INTO public.fact_elevators (\"serialNumber\", \"dateCommissioning\", \"buildingId\", \"customerId\", city) VALUES('#{val[0]}','#{val[1]}', #{val[2]}, #{val[3]}, '#{val[4].gsub("'","''")}');"
            ActiveRecord::Base.connection.execute(query)
        end
    end
    # not finished
    task :dim_customer do
        ActiveRecord::Base.establish_connection(:adapter  => "mysql2",:host => ENV["HOST_MYSQL"],:username => ENV["MYSQL_USERNAME"],:password => ENV["MYSQL_PASSWORD"],:database => ENV["MYSQL_DATABASE"])
        row = ActiveRecord::Base.connection.execute(ENV["DIM_CUSTOMER_QUERY"])
        ActiveRecord::Base.establish_connection(:adapter  => "postgresql",:host => ENV["HOST_POSTGRESQL"], :username => ENV["POSTGRESQL_USERNAME"],:password => ENV["POSTGRESQL_PASSWORD"],:database => ENV["POSTGRESQL_DATABASE"])
        row.each do |val|
            query = "INSERT INTO public.dim_customers (creation_date, \"compagnyName\", \"fullNameContact\", email, \"nbElevator\",city) VALUES('#{val[0]}','#{val[1].gsub("'","''")}', '#{val[2].gsub("'","''")}', '#{val[3]}', #{val[4]}, '#{val[5].gsub("'","''")}');"
            ActiveRecord::Base.connection.execute(query)
        end
    end
  end