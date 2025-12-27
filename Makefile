BUCKET_NAME = lechuza.cafe

build:
	hugo

deploy: build
	aws --profile hugo-deploy s3 sync public/ s3://$(BUCKET_NAME) --delete
	aws --profile hugo-deploy s3 website s3://$(BUCKET_NAME) --index-document index.html --error-document 404.html