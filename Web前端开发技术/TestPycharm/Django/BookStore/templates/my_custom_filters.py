# myapp/templatetags/my_custom_filters.py

from django import template

register = template.Library()

@register.filter(name='upper')
def upper(value):
    """Converts a string into all uppercase."""
    return value.upper()

@register.filter(name='to_dict')
def to_dict(obj):
    return [(field.name, getattr(obj, field.name)) for field in obj._meta.fields]
