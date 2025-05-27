from django.contrib import admin
from django.urls import path
from payments.views import buy, item_detail

urlpatterns = [
    path('admin/', admin.site.urls),
    path('buy/<int:id>', buy),
    path('item/<int:id>', item_detail),
]