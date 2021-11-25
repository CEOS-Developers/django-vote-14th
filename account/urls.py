from django.urls import path
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from .views import RegisterAPIView, TestAPIView

urlpatterns = [
    path("signin", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    # 세션 연장하고 싶을 때 refresh token 사용
    # path("token/refresh", TokenRefreshView.as_view(), name="token_refresh"),
    path("signup", RegisterAPIView.as_view()),
    path("test", TestAPIView.as_view()),
]
