create view blogger_sample as
select a.gid, gender as gender_blogger, location as location_blogger, industry as industry_blogger, occupation as occupation_blogger
from dbo.PROJECTS_DS_media_users  a 
left join dbo.PROJECTS_DS_blogger b on a.gid=b.gid 
--35382 unique clients here 

create view youtube_sample as
select a.gid, age as age_youtube, location as location_youtube, last_active as last_active_youtube, occupation as occupation_youtube, companies as companies_youtube, schools as schools_youtube, connections as connections_youtube
from dbo.PROJECTS_DS_media_users  a 
left join dbo.PROJECTS_DS_youtube b on a.gid=b.gid 

create view twitter_sample as
select a.gid, location as location_twitter, last_active as last_active_twitter, connections as n_connections_twitter 
from dbo.PROJECTS_DS_media_users  a 
left join dbo.PROJECTS_DS_twitter b on a.gid=b.gid 

create view google_sample as 
select a.gid, occupation as occupation_google,companies as companies_google,schools as schools_google,organization as organization_google,location as location_google
from dbo.PROJECTS_DS_media_users  a 
left join dbo.PROJECTS_DS_google b on a.gid=b.gid 


create view facebook_sample as
select a.gid, gender as gender_facebook, location as location_facebook, schools as schools_facebook, companies as companies_facebook, age_group as age_group_facebook, connections as n_connections_facebook
from dbo.PROJECTS_DS_media_users  a 
left join dbo.PROJECTS_DS_facebook b on a.gid=b.gid 

create view fb_google_sample as
select a.*, occupation_google, companies_google, schools_google, organization_google, location_google  from facebook_sample a left join google_sample b on a.gid=b.gid

create view twitter_youtube_sample as 
select a.*, location_twitter,last_active_twitter, n_connections_twitter from youtube_sample  a left join twitter_sample b on a.gid=b.gid

create view fb_google_youtube_twi_sample as 
select a.*, age_youtube, location_youtube, last_active_youtube, occupation_youtube,companies_youtube,schools_youtube
,connections_youtube,location_twitter,last_active_twitter,n_connections_twitter
 from fb_google_sample a left join twitter_youtube_sample b on a.gid=b.gid
--four social media together 

create view total as 
select a.*, gender_blogger, location_blogger, industry_blogger, occupation_blogger from fb_google_youtube_twi_sample a
left join dbo.blogger_sample b on a.gid=b.gid
--the final view (adding blogger) 



