from rovi.tv_listings import TVListings

tv_listings = TVListings(api_key='CHANGE-ME')
print tv_listings.services(postal_code='00911', country_code='US')
print tv_listings.service_details(service_id='361032')
print tv_listings.service_details(service_id='361032')
print tv_listings.grid_schedule(service_id='361032')
print tv_listings.program_details(program_id='4258917')
print tv_listings.celebrity_details(name_id='100614')