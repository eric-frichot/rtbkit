# RTBKIT adserver makefile

LIBADSERVERCONNECTOR_SOURCES := \
	adserver_connector.cc \
	http_adserver_connector.cc

LIBADSERVERCONNECTOR_LINK := \
	zeromq boost_thread utils endpoint services rtb

$(eval $(call library,adserver_connector, \
	$(LIBADSERVERCONNECTOR_SOURCES),  \
	$(LIBADSERVERCONNECTOR_LINK)))


# standard events
LIBSTANDARDEVENTS_SOURCES := \
	standard_value_descriptions.cc

LIBSTANDARDEVENTS_LINK := \
	value_description types

$(eval $(call library,standard_events, \
	$(LIBSTANDARDEVENTS_SOURCES),  \
	$(LIBSTANDARDEVENTS_LINK)))

$(eval $(call library,mock_adserver,mock_adserver_connector.cc mock_win_source.cc,adserver_connector bid_test_utils))
$(eval $(call library,standard_adserver,standard_adserver_connector.cc standard_win_source.cc,adserver_connector bid_test_utils))
$(eval $(call program,adserver_runner,adserver_connector boost_program_options services))

