PROJECT = emq_auth_username
PROJECT_DESCRIPTION = Authentication with Username/Password

PROJECT_VERSION = 2.2

BUILD_DEPS = emqttd cuttlefish clique
dep_emqttd = git https://github.com/emqtt/emqttd emq22
dep_cuttlefish = git https://github.com/emqtt/cuttlefish
dep_clique = git https://github.com/turtleDeng/clique

NO_AUTOPATCH = cuttlefish

ERLC_OPTS += +'{parse_transform, lager_transform}'

TEST_ERLC_OPTS += +debug_info

TEST_ERLC_OPTS += +'{parse_transform, lager_transform}'

COVER = true

include erlang.mk

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emq_auth_username.conf -i priv/emq_auth_username.schema -d data
