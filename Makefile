PROJECT = emq_auth_username
PROJECT_DESCRIPTION = Authentication with Username/Password
PROJECT_VERSION = 3.0

BUILD_DEPS = emqttd
dep_emqttd = git https://github.com/emqtt/emqttd master

TEST_DEPS = cuttlefish
dep_cuttlefish = git https://github.com/emqtt/cuttlefish

ERLC_OPTS += +'{parse_transform, lager_transform}'

COVER = true

include erlang.mk

app.config::
	cuttlefish -l info -e etc/ -c etc/emq_auth_username.conf -i priv/emq_auth_username.schema -d data
