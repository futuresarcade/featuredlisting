build:
	rm -rf public
	hugo

	deploy: build
		aws s3 sync public/ s3://featuredlisting.forale --acl public-read --delete
		aws configure set preview.cloudfront true
		aws cloudfront create-invalidation --distribution-id E1EBL62XOT88TR --paths '/*'
