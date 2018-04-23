> str(DATASET_SOCIAL_MEDIA_2)
> DATASET_SOCIAL_MEDIA_2$location_all <- NA
> within(DATASET_SOCIAL_MEDIA_2, DATASET_SOCIAL_MEDIA_2$location_all <- paste(DATASET_SOCIAL_MEDIA_2$location_blogger,DATASET_SOCIAL_MEDIA_2$location_facebook,DATASET_SOCIAL_MEDIA_2$location_google,DATASET_SOCIAL_MEDIA_2$location_twitter, DATASET_SOCIAL_MEDIA_2$location_youtube, sep=' '))
> summary(DATASET_SOCIAL_MEDIA_2$location_all)

> rm(location_cols)
> #deleting location columns

  > location_cols <- c('location_blogger', 'location_facebook', 'location_google', 'location_twitter', 'location_youtube')
> DATASET_SOCIAL_MEDIA_2$location_all <- apply(DATASET_SOCIAL_MEDIA_2[, location_cols], 1, paste, collapse = " ")
> schools_cols <- c('schools_facebook', 'schools_google', 'schools_youtube')
> DATASET_SOCIAL_MEDIA_2$schools_all <- apply(DATASET_SOCIAL_MEDIA_2[, schools_cols], 1, paste, collapse = " ")
> occupation_cols <- c('occupation_google', 'occupation_youtube', 'occupation_blogger')
> DATASET_SOCIAL_MEDIA_2$occupations_all <- apply(DATASET_SOCIAL_MEDIA_2[, occupation_cols], 1, paste, collapse = " ")
> companies_cols <- c('companies_facebook', 'companies_google', 'companies_youtube')
> DATASET_SOCIAL_MEDIA_2$companies_all <- apply(DATASET_SOCIAL_MEDIA_2[, companies_cols], 1, paste, collapse = " ")

> summary(DATASET_SOCIAL_MEDIA_2$age_youtube)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
14.00   26.00   31.00   33.45   38.00  111.00   15121 

> DATASET_SOCIAL_MEDIA_2$age_all <- DATASET_SOCIAL_MEDIA_2$age_youtube
> #first just filling in what we have as a single figure
> summary(DATASET_SOCIAL_MEDIA_2$age_group_facebook)

> library(dplyr)
> unique(DATASET_SOCIAL_MEDIA_2$age_group_facebook)
[1] NA       "25-34"  "55-64"  "18-24"  "35-44"  "45-54"  "25-34'" "0-17"   "65+"    "35-44'" "18-24'" "65+'"  
[13] "45-54'"
> #so here we have unique age groups

> DATASET_SOCIAL_MEDIA_2$age_group_facebook[DATASET_SOCIAL_MEDIA_2$age_group_facebook == "25-34"] <- 30
> DATASET_SOCIAL_MEDIA_2$age_group_facebook[DATASET_SOCIAL_MEDIA_2$age_group_facebook == "55-64"] <- 60
> DATASET_SOCIAL_MEDIA_2$age_group_facebook[DATASET_SOCIAL_MEDIA_2$age_group_facebook == "18-24"] <- 21
> DATASET_SOCIAL_MEDIA_2$age_group_facebook[DATASET_SOCIAL_MEDIA_2$age_group_facebook == "35-44"] <- 40
> DATASET_SOCIAL_MEDIA_2$age_group_facebook[DATASET_SOCIAL_MEDIA_2$age_group_facebook == "45-54"] <- 50
> DATASET_SOCIAL_MEDIA_2$age_group_facebook[DATASET_SOCIAL_MEDIA_2$age_group_facebook == "25-34'"] <- 30
> DATASET_SOCIAL_MEDIA_2$age_group_facebook[DATASET_SOCIAL_MEDIA_2$age_group_facebook == "0-17"] <- 15
> DATASET_SOCIAL_MEDIA_2$age_group_facebook[DATASET_SOCIAL_MEDIA_2$age_group_facebook == "65+"] <- 70
> DATASET_SOCIAL_MEDIA_2$age_group_facebook[DATASET_SOCIAL_MEDIA_2$age_group_facebook == "35-44'"] <- 40
> DATASET_SOCIAL_MEDIA_2$age_group_facebook[DATASET_SOCIAL_MEDIA_2$age_group_facebook == "18-24'"] <- 21
> DATASET_SOCIAL_MEDIA_2$age_group_facebook[DATASET_SOCIAL_MEDIA_2$age_group_facebook == "65+'"] <- 70
> DATASET_SOCIAL_MEDIA_2$age_group_facebook[DATASET_SOCIAL_MEDIA_2$age_group_facebook == "45-54'"] <- 50
> unique(DATASET_SOCIAL_MEDIA_2$age_group_facebook)
 [1] NA   "30" "60" "21" "40" "50" "15" "70"
NAs are not allowed in subscripted assignments

> DATASET_SOCIAL_MEDIA_2$age_all<- ifelse(DATASET_SOCIAL_MEDIA_2$age_all== "", DATASET_SOCIAL_MEDIA_2$age_group_facebook, DATASET_SOCIAL_MEDIA_2$age_all)
> summary(DATASET_SOCIAL_MEDIA_2$age_all)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
14.00   26.00   31.00   33.45   38.00  111.00   15121 

> #looks like the problem with age replacement by facebook ages is not resolved 
> DATASET_SOCIAL_MEDIA_2$location_all <- gsub('NA', '', DATASET_SOCIAL_MEDIA_2$location_all)
> #quickly and easily removed all NAs
> DATASET_SOCIAL_MEDIA_2$schools_all <- gsub('NA', '', DATASET_SOCIAL_MEDIA_2$schools_all)
> DATASET_SOCIAL_MEDIA_2$occupations_all <- gsub('NA', '', DATASET_SOCIAL_MEDIA_2$occupations_all)
> DATASET_SOCIAL_MEDIA_2$companies_all <- gsub('NA', '', DATASET_SOCIAL_MEDIA_2$companies_all)
> DATASET_SOCIAL_MEDIA_2$age_all<- ifelse(DATASET_SOCIAL_MEDIA_2$age_all== " ", DATASET_SOCIAL_MEDIA_2$age_group_facebook, DATASET_SOCIAL_MEDIA_2$age_all)
> DATASET_SOCIAL_MEDIA_2$age_all<- ifelse(DATASET_SOCIAL_MEDIA_2$age_all== "NA", DATASET_SOCIAL_MEDIA_2$age_group_facebook, DATASET_SOCIAL_MEDIA_2$age_all)
> DATASET_SOCIAL_MEDIA_2$location_all <- tolower(DATASET_SOCIAL_MEDIA_2$location_all)

> #everything to lowercase
> DATASET_SOCIAL_MEDIA_2$schools_all <- tolower(DATASET_SOCIAL_MEDIA_2$schools_all)
> DATASET_SOCIAL_MEDIA_2$occupations_all <- tolower(DATASET_SOCIAL_MEDIA_2$occupations_all)
> DATASET_SOCIAL_MEDIA_2$companies_all <- tolower(DATASET_SOCIAL_MEDIA_2$companies_all)

> DATASET_SOCIAL_MEDIA_2$companies_all <- gsub('&', ' ', DATASET_SOCIAL_MEDIA_2$companies_all)
> DATASET_SOCIAL_MEDIA_2$occupations_all <- gsub('&', ' ', DATASET_SOCIAL_MEDIA_2$occupations_all)
> DATASET_SOCIAL_MEDIA_2$schools_all <- gsub('&', ' ', DATASET_SOCIAL_MEDIA_2$schools_all)
> DATASET_SOCIAL_MEDIA_2$location_all <- gsub('&', ' ', DATASET_SOCIAL_MEDIA_2$location_all)

> #next step is removing the replicate/doubles from each column
> #like "shanghai shanghai china" must turn into "changhai china" 
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                