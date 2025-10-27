from django.urls import path
from . import views


urlpatterns = [
    path("", views.image_upload, name="img_upload"),
    path("media/<str:filename>/", views.view_img, name="view_img"),
]
