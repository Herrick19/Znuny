-- ----------------------------------------------------------
--  driver: postgresql, generated: 2013-08-06 13:25:06
-- ----------------------------------------------------------
SET standard_conforming_strings TO ON;
-- ----------------------------------------------------------
--  insert into table ticket_history_type
-- ----------------------------------------------------------
INSERT INTO ticket_history_type (name, valid_id, create_by, create_time, change_by, change_time)
    VALUES
    ('TitleUpdate', 1, 1, current_timestamp, 1, current_timestamp);
DROP INDEX index_search_date;
CREATE INDEX dynamic_field_value_search_date ON dynamic_field_value (field_id, value_date);
DROP INDEX index_search_int;
CREATE INDEX dynamic_field_value_search_int ON dynamic_field_value (field_id, value_int);
DROP INDEX index_field_values;
CREATE INDEX dynamic_field_value_field_values ON dynamic_field_value (object_id);
DROP INDEX article_message_id;
-- ----------------------------------------------------------
--  alter table article
-- ----------------------------------------------------------
ALTER TABLE article ADD a_message_id_md5 VARCHAR (32) NULL;
CREATE INDEX article_message_id_md5 ON article (a_message_id_md5);
DROP INDEX article_search_message_id;
-- ----------------------------------------------------------
--  alter table article_search
-- ----------------------------------------------------------
ALTER TABLE article_search DROP a_message_id;
-- ----------------------------------------------------------
--  create table system_data
-- ----------------------------------------------------------
CREATE TABLE system_data (
    data_key VARCHAR (160) NOT NULL,
    data_value TEXT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(data_key)
);
-- ----------------------------------------------------------
--  create table acl
-- ----------------------------------------------------------
CREATE TABLE acl (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    comments VARCHAR (250) NULL,
    description VARCHAR (250) NULL,
    valid_id INTEGER NOT NULL,
    stop_after_match INTEGER NULL,
    config_match TEXT NULL,
    config_change TEXT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT acl_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table acl_sync
-- ----------------------------------------------------------
CREATE TABLE acl_sync (
    acl_id VARCHAR (200) NOT NULL,
    sync_state VARCHAR (30) NOT NULL,
    create_time timestamp(0) NOT NULL,
    change_time timestamp(0) NOT NULL
);
ALTER TABLE standard_response DROP CONSTRAINT FK_standard_response_valid_id_id;
ALTER TABLE standard_response DROP CONSTRAINT FK_standard_response_create_by_id;
ALTER TABLE standard_response DROP CONSTRAINT FK_standard_response_change_by_id;
ALTER TABLE queue_standard_response DROP CONSTRAINT FK_queue_standard_response_standard_response_id_id;
ALTER TABLE queue_standard_response DROP CONSTRAINT FK_queue_standard_response_queue_id_id;
ALTER TABLE queue_standard_response DROP CONSTRAINT FK_queue_standard_response_create_by_id;
ALTER TABLE queue_standard_response DROP CONSTRAINT FK_queue_standard_response_change_by_id;
ALTER TABLE standard_response_attachment DROP CONSTRAINT FK_standard_response_attachment_standard_response_id_id;
ALTER TABLE standard_response_attachment DROP CONSTRAINT FK_standard_response_attachment_standard_attachment_id_id;
ALTER TABLE standard_response_attachment DROP CONSTRAINT FK_standard_response_attachment_create_by_id;
ALTER TABLE standard_response_attachment DROP CONSTRAINT FK_standard_response_attachment_change_by_id;
ALTER TABLE standard_response DROP CONSTRAINT standard_response_name;
-- ----------------------------------------------------------
--  alter table standard_template
-- ----------------------------------------------------------
ALTER TABLE standard_response RENAME TO standard_template;
-- ----------------------------------------------------------
--  alter table queue_standard_template
-- ----------------------------------------------------------
ALTER TABLE queue_standard_response RENAME TO queue_standard_template;
-- ----------------------------------------------------------
--  alter table standard_template_attachment
-- ----------------------------------------------------------
ALTER TABLE standard_response_attachment RENAME TO standard_template_attachment;
-- ----------------------------------------------------------
--  alter table standard_template
-- ----------------------------------------------------------
ALTER TABLE standard_template ADD template_type VARCHAR (100) NULL;
UPDATE standard_template SET template_type = 'Answer' WHERE template_type IS NULL;
ALTER TABLE standard_template ALTER template_type SET DEFAULT 'Answer';
ALTER TABLE standard_template ALTER template_type SET NOT NULL;
ALTER TABLE standard_template ADD CONSTRAINT standard_template_name UNIQUE (name);
ALTER TABLE standard_template ADD CONSTRAINT FK_standard_template_valid_id_id FOREIGN KEY (valid_id) REFERENCES valid (id);
ALTER TABLE standard_template ADD CONSTRAINT FK_standard_template_create_by_id FOREIGN KEY (create_by) REFERENCES users (id);
ALTER TABLE standard_template ADD CONSTRAINT FK_standard_template_change_by_id FOREIGN KEY (change_by) REFERENCES users (id);
-- ----------------------------------------------------------
--  alter table queue_standard_template
-- ----------------------------------------------------------
ALTER TABLE queue_standard_template RENAME standard_response_id TO standard_template_id;
-- ----------------------------------------------------------
--  alter table queue_standard_template
-- ----------------------------------------------------------
ALTER TABLE queue_standard_template ALTER standard_template_id TYPE INTEGER;
ALTER TABLE queue_standard_template ALTER standard_template_id DROP DEFAULT;
UPDATE queue_standard_template SET standard_template_id = 0 WHERE standard_template_id IS NULL;
ALTER TABLE queue_standard_template ALTER standard_template_id SET NOT NULL;
ALTER TABLE queue_standard_template ADD CONSTRAINT FK_queue_standard_template_standard_template_id_id FOREIGN KEY (standard_template_id) REFERENCES standard_template (id);
ALTER TABLE queue_standard_template ADD CONSTRAINT FK_queue_standard_template_queue_id_id FOREIGN KEY (queue_id) REFERENCES queue (id);
ALTER TABLE queue_standard_template ADD CONSTRAINT FK_queue_standard_template_create_by_id FOREIGN KEY (create_by) REFERENCES users (id);
ALTER TABLE queue_standard_template ADD CONSTRAINT FK_queue_standard_template_change_by_id FOREIGN KEY (change_by) REFERENCES users (id);
-- ----------------------------------------------------------
--  alter table standard_template_attachment
-- ----------------------------------------------------------
ALTER TABLE standard_template_attachment RENAME standard_response_id TO standard_template_id;
-- ----------------------------------------------------------
--  alter table standard_template_attachment
-- ----------------------------------------------------------
ALTER TABLE standard_template_attachment ALTER standard_template_id TYPE INTEGER;
ALTER TABLE standard_template_attachment ALTER standard_template_id DROP DEFAULT;
UPDATE standard_template_attachment SET standard_template_id = 0 WHERE standard_template_id IS NULL;
ALTER TABLE standard_template_attachment ALTER standard_template_id SET NOT NULL;
ALTER TABLE standard_template_attachment ADD CONSTRAINT FK_standard_template_attachment_standard_template_id_id FOREIGN KEY (standard_template_id) REFERENCES standard_template (id);
ALTER TABLE standard_template_attachment ADD CONSTRAINT FK_standard_template_attachment_standard_attachment_id_id FOREIGN KEY (standard_attachment_id) REFERENCES standard_attachment (id);
ALTER TABLE standard_template_attachment ADD CONSTRAINT FK_standard_template_attachment_create_by_id FOREIGN KEY (create_by) REFERENCES users (id);
ALTER TABLE standard_template_attachment ADD CONSTRAINT FK_standard_template_attachment_change_by_id FOREIGN KEY (change_by) REFERENCES users (id);
SET standard_conforming_strings TO ON;
ALTER TABLE system_data ADD CONSTRAINT FK_system_data_create_by_id FOREIGN KEY (create_by) REFERENCES users (id);
ALTER TABLE system_data ADD CONSTRAINT FK_system_data_change_by_id FOREIGN KEY (change_by) REFERENCES users (id);
ALTER TABLE acl ADD CONSTRAINT FK_acl_create_by_id FOREIGN KEY (create_by) REFERENCES users (id);
ALTER TABLE acl ADD CONSTRAINT FK_acl_change_by_id FOREIGN KEY (change_by) REFERENCES users (id);
ALTER TABLE acl ADD CONSTRAINT FK_acl_valid_id_id FOREIGN KEY (valid_id) REFERENCES valid (id);
