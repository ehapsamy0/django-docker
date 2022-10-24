import environ
from .base import *

env = environ.Env()
DEBUG = True
ALLOWED_HOSTS = ['*']

# DATABASE
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'HOST': env("DATABASE_HOST"),
        'PORT': env("DATABASE_PORT"),
        'NAME': env("DATABASE_NAME"),
        'USER': env("DATABASE_USER"),
        'PASSWORD': env("DATABASE_PASS"),
        'OPTIONS': {
            'sslmode': 'require',
        },
    }
}

# STATIC FILES (S3)
# AWS_ACCESS_KEY_ID = env("AWS_ACCESS_KEY_ID")
# AWS_SECRET_ACCESS_KEY = env("AWS_SECRET_ACCESS_KEY")
# AWS_STORAGE_BUCKET_NAME = env("AWS_STORAGE_BUCKET_NAME")
# AWS_DEFAULT_ACL = 'public-read'
# AWS_S3_ENDPOINT_URL = env("AWS_S3_ENDPOINT_URL")
# AWS_S3_OBJECT_PARAMETERS = {'CacheControl': 'max-age=25060'}
# AWS_LOCATION = 'location'
# STATIC_URL = 'https://%s/%s/' % (AWS_S3_ENDPOINT_URL, AWS_LOCATION)
# STATICFILES_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'
# DEFAULT_FILE_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'


STATICFILES_DIRS = [os.path.join(BASE_DIR, '../static')]


# # ELASTIC SEARCH
# ELASTICSEARCH_DSL = {
#     "default": {
#         "hosts": "http://{}:{}@{}:{}/".format(env("ELASTICSEARCH_USERNAME"), env("ELASTICSEARCH_PASSWORD"),
#                                               env("ELASTICSEARCH_DOMAIN"), env("ELASTICSEARCH_PORT"))
#     }
# }

ELASTICSEARCH_DSL = {
    "default": {"hosts": "esearch:9200"}
}