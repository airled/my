class CreateUrls

	def up
		create_table :urls do
			primary_key :id
			String :url
		end
	end
	
	def down
		drop_table(:urls)
	end
end		