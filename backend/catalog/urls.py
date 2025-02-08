from rest_framework.routers import DefaultRouter

from .views import PictureWS, DiplomaWS, ExhibitionWS, MethodicalWS, \
    photo_galleryWS, photo_diplomaWS, TechniqueWS, PressWS

router = DefaultRouter()
router.register(r'picture', PictureWS, basename='picture full description')
router.register(r'diploma', DiplomaWS, basename='diploma full description')
router.register(r'exhibition', ExhibitionWS, basename='exhibition description')
router.register(r'methodical', MethodicalWS, basename='methodical')
router.register(r'press', PressWS, basename='press')
router.register(r'photo-gallery', photo_galleryWS, basename='pg')
router.register(r'photo-diploma', photo_diplomaWS, basename='pd')
router.register(r'technique', TechniqueWS, basename='technique')

urlpatterns = router.urls