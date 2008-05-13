// ----------------------------------------------------------
//  driver: maxdb, generated: 2008-05-13 11:18:49
// ----------------------------------------------------------
// ----------------------------------------------------------
//  create table queue_preferences
// ----------------------------------------------------------
CREATE TABLE queue_preferences
(
    queue_id INTEGER NOT NULL,
    preferences_key VARCHAR (150) NOT NULL,
    preferences_value VARCHAR (250)
)
//
CREATE INDEX queue_preferences_qu51 ON queue_preferences (queue_id)
//
// ----------------------------------------------------------
//  create table service_sla
// ----------------------------------------------------------
CREATE TABLE service_sla
(
    service_id INTEGER NOT NULL,
    sla_id INTEGER NOT NULL,
    UNIQUE service_sla_service_sla (service_id, sla_id)
)
//
// ----------------------------------------------------------
//  create table link_object_type
// ----------------------------------------------------------
CREATE TABLE link_object_type
(
    id serial,
    name VARCHAR (50) NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    UNIQUE link_object_type_name (name)
)
//
// ----------------------------------------------------------
//  create table link_object_state
// ----------------------------------------------------------
CREATE TABLE link_object_state
(
    id serial,
    name VARCHAR (50) NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    UNIQUE link_object_state_name (name)
)
//
// ----------------------------------------------------------
//  create table link_object_object
// ----------------------------------------------------------
CREATE TABLE link_object_object
(
    id serial,
    name VARCHAR (100) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE link_object_object_name (name)
)
//
// ----------------------------------------------------------
//  create table link_object
// ----------------------------------------------------------
CREATE TABLE link_object
(
    source_object_id SMALLINT NOT NULL,
    source_key VARCHAR (50) NOT NULL,
    target_object_id SMALLINT NOT NULL,
    target_key VARCHAR (50) NOT NULL,
    type_id SMALLINT NOT NULL,
    state_id SMALLINT NOT NULL,
    UNIQUE link_object_relation (source_object_id, source_key, target_object_id, target_key, type_id)
)
//
// ----------------------------------------------------------
//  alter table queue
// ----------------------------------------------------------
ALTER TABLE queue ADD first_response_notify SMALLINT
//
// ----------------------------------------------------------
//  alter table queue
// ----------------------------------------------------------
ALTER TABLE queue ADD update_notify SMALLINT
//
// ----------------------------------------------------------
//  alter table queue
// ----------------------------------------------------------
ALTER TABLE queue ADD solution_notify SMALLINT
//
// ----------------------------------------------------------
//  alter table sla
// ----------------------------------------------------------
ALTER TABLE sla ADD first_response_notify SMALLINT
//
// ----------------------------------------------------------
//  alter table sla
// ----------------------------------------------------------
ALTER TABLE sla ADD update_notify SMALLINT
//
// ----------------------------------------------------------
//  alter table sla
// ----------------------------------------------------------
ALTER TABLE sla ADD solution_notify SMALLINT
//
// ----------------------------------------------------------
//  alter table mail_account
// ----------------------------------------------------------
ALTER TABLE pop3_account TO mail_account
//
// ----------------------------------------------------------
//  alter table mail_account
// ----------------------------------------------------------
ALTER TABLE mail_account ADD account_type VARCHAR (20)
//
// ----------------------------------------------------------
//  alter table article
// ----------------------------------------------------------
ALTER TABLE article CHANGE a_body a_body LONG NOT NULL
//
// ----------------------------------------------------------
//  alter table xml_storage
// ----------------------------------------------------------
ALTER TABLE xml_storage CHANGE xml_content_value xml_content_value LONG
//
// ----------------------------------------------------------
//  insert into table notifications
// ----------------------------------------------------------
INSERT INTO notifications (notification_type, notification_charset, notification_language, subject, text, create_by, create_time, change_by, change_time)
    VALUES
    ('Agent::EscalationNotifyBefore', 'iso-8859-1', 'en', 'Ticket Escalation Warning! (<OTRS_CUSTOMER_SUBJECT[24]>)', 'Hi <OTRS_UserFirstname>,the ticket "<OTRS_TICKET_TicketNumber>" will escalate!Escalation at: <OTRS_TICKET_EscalationDestinationDate>Escalation in: <OTRS_TICKET_EscalationDestinationIn><OTRS_CUSTOMER_FROM>wrote:<snip><OTRS_CUSTOMER_EMAIL[30]><snip>Please have a look at:<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentZoom&TicketID=<OTRS_TICKET_TicketID>Your OTRS Notification Master', 1, timestamp, 1, timestamp)
//
// ----------------------------------------------------------
//  insert into table notifications
// ----------------------------------------------------------
INSERT INTO notifications (notification_type, notification_charset, notification_language, subject, text, create_by, create_time, change_by, change_time)
    VALUES
    ('Agent::EscalationNotifyBefore', 'iso-8859-1', 'de', 'Ticket Eskalations-Warnung! (<OTRS_CUSTOMER_SUBJECT[24]>)', 'Hallo <OTRS_UserFirstname> <OTRS_UserLastname>,das Ticket "<OTRS_TICKET_TicketNumber>" wird bald eskalieren!Eskalation um: <OTRS_TICKET_EscalationDestinationDate>Eskalation in: <OTRS_TICKET_EscalationDestinationIn><OTRS_CUSTOMER_FROM>schrieb:<snip><OTRS_CUSTOMER_EMAIL[30]><snip>Bitte um Bearbeitung:<OTRS_CONFIG_HttpType>://<OTRS_CONFIG_FQDN>/<OTRS_CONFIG_ScriptAlias>index.pl?Action=AgentZoom&TicketID=<OTRS_TICKET_TicketID>Ihr OTRS Benachrichtigungs-Master', 1, timestamp, 1, timestamp)
//
// ----------------------------------------------------------
//  insert into table link_object_type
// ----------------------------------------------------------
INSERT INTO link_object_type (name, valid_id, create_by, create_time, change_by, change_time)
    VALUES
    ('normal', 1, 1, timestamp, 1, timestamp)
//
// ----------------------------------------------------------
//  insert into table link_object_type
// ----------------------------------------------------------
INSERT INTO link_object_type (name, valid_id, create_by, create_time, change_by, change_time)
    VALUES
    ('parent-child', 1, 1, timestamp, 1, timestamp)
//
// ----------------------------------------------------------
//  insert into table link_object_state
// ----------------------------------------------------------
INSERT INTO link_object_state (name, valid_id, create_by, create_time, change_by, change_time)
    VALUES
    ('valid', 1, 1, timestamp, 1, timestamp)
//
// ----------------------------------------------------------
//  insert into table link_object_state
// ----------------------------------------------------------
INSERT INTO link_object_state (name, valid_id, create_by, create_time, change_by, change_time)
    VALUES
    ('temporary', 1, 1, timestamp, 1, timestamp)
//
