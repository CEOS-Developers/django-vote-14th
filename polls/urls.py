from django.urls import include, path
from rest_framework import routers

from polls import views
from polls.views import QuestionViewSet, CandidateViewSet

router = routers.DefaultRouter()
router.register(r'questions', QuestionViewSet)
router.register(r'candidates', CandidateViewSet)


urlpatterns = [
    path('', include(router.urls)),
    #path('votes/', views.CastVote.as_view()),
]
