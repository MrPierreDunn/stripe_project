from django.db import models


class Item(models.Model):
    """Модель для товаров."""
    name = models.CharField(max_length=255, verbose_name='Название товара')
    description = models.TextField('Описание товара')
    price = models.IntegerField('Цена', help_text='указывается в $')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'товар'
        verbose_name_plural = 'Товары'
