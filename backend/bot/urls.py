from rest_framework.routers import DefaultRouter

from .views import OrderWS, CommentWS

router = DefaultRouter()
router.register(r'order', OrderWS, basename='order')
router.register(r'comment', CommentWS, basename='comment')

urlpatterns = router.urls

