class Nutritionix < ActiveRecord::Base
 #API CALLS

 #root: "https://api.nutritionix.com/v1_1/search/
 #search: mcdonalds
 #results: ?results=0:20
 #fields: &fields=item_name,brand_name,item_id,nf_calories
 #appID: &appId=223280a9
 #appKEY: &appKey=ea7e80008172e552de3d742a31194d06"
 	API_ROOT_URL = 'https://api.nutritionix.com/v1_1/search/'
 	FIELDS = ['&fields=item_name', 'item_id', 'brand_name', 'brand_id', 'nf_calories', 'nf_calories_from_fat', 
 						'nf_total_carbohydrate', 'nf_total_fat', 'nf_protein'].join(',')
 	APP_ID = '&appId=223280a9'
 	APP_KEY = '&appKey=ea7e80008172e552de3d742a31194d06'


 def self.search(term)
 	search_url = [
 		API_ROOT_URL,
 		URI.escape(term),
 		'?results=0:4',
 		FIELDS,
 		APP_ID,
 		APP_KEY
 	].join

 	response = HTTParty.get(search_url)

 	response
 end
end