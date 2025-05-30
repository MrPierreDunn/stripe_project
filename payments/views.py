import stripe
from django.conf import settings
from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render

from .models import Item

stripe.api_key = settings.STRIPE_SECRET_KEY


def buy(request, id):
    item = get_object_or_404(Item, pk=id)
    session = stripe.checkout.Session.create(
        payment_method_types=['card'],
        line_items=[{
            'price_data': {
                'currency': 'usd',
                'product_data': {
                    'name': item.name,
                },
                'unit_amount': item.price * 100,
            },
            'quantity': 1,
        }],
        mode='payment',
        success_url='https://example.com/success',
        cancel_url='https://example.com/cancel',
    )
    return JsonResponse({'id': session.id})


def item_detail(request, id):
    item = get_object_or_404(Item, pk=id)
    return render(request, 'payments/item.html', {
        'item': item,
        'stripe_public_key': settings.STRIPE_PUBLISHABLE_KEY
    })
