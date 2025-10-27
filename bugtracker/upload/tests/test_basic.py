import pytest

@pytest.mark.django_db
def test_homepage_status(client):
    res = client.get("/upload/")
    assert res.status_code == 200
