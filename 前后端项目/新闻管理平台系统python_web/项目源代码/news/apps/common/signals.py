# myapp/signals.py

from django.db.models.signals import pre_save
from django.dispatch import receiver
from django.utils import timezone

@receiver(pre_save)
def pre_save_timestamp_handler(sender, instance, **kwargs):
    if hasattr(instance, 'create_time') and not instance.create_time:
        instance.create_time = timezone.now()
    instance.update_time = timezone.now()

