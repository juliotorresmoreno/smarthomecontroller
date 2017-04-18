DROP TABLE IF EXISTS operations;
CREATE TABLE operations(
    accion_id       BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    name            VARCHAR(100) NOT NULL,
    module_id       BIGINT NOT NULL,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (accion_id)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
    city_id         BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    name            VARCHAR(200) NOT NULL,
    state_id        BIGINT NOT NULL,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (city_id)
);

DROP TABLE IF EXISTS conditions;
CREATE TABLE conditions(
    condition_id    BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    schedule_id     BIGINT NOT NULL,
    `condition`     TEXT NOT NULL,
    condition_type  enum('dispositivo','ubicacion') NOT NULL,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (condition_id)
);

DROP TABLE IF EXISTS consumptions;
CREATE TABLE consumptions (
    consumption_id  BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    device_id       BIGINT NOT NULL,
    date            DATE NOT NULL,
    time            TIME NOT NULL,
    consumption     INT NOT NULL,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (consumption_id)
);

DROP TABLE IF EXISTS countries;
CREATE TABLE countries(
    country_id      BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    name            VARCHAR(100) NOT NULL,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (country_id)
);

DROP TABLE IF EXISTS devices;
CREATE TABLE devices(
    device_id       BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    name            VARCHAR(100) NOT NULL,
    user_id         BIGINT NOT NULL,
    location_id     BIGINT NOT NULL,
    UUID            VARCHAR(100) NOT NULL,
    state_onoff     TINYINT NOT NULL default 0,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (device_id)
);

DROP TABLE IF EXISTS incidence_type;
CREATE TABLE incidence_type(
    incidence_type_id   BIGINT NOT NULL auto_increment,
    state               TINYINT NOT NULL default 1,
    name                VARCHAR(100) NOT NULL,
    created_at          DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at           DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at           DATETIME,
    PRIMARY KEY (incidence_type_id)
);

DROP TABLE IF EXISTS incidences;
CREATE TABLE incidences(
    incidence_id        BIGINT NOT NULL auto_increment,
    state               TINYINT NOT NULL default 1,
    title               VARCHAR(100) NOT NULL,
    description         TEXT NOT NULL,
    incidence_type_id   BIGINT NOT NULL,
    progress            ENUM('Open','review','finished','close') NOT NULL,
    created_at          DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at           DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at           DATETIME,
    PRIMARY KEY (incidence_id)
);

DROP TABLE IF EXISTS incidences_tracking;
CREATE TABLE incidences_tracking(
    incidence_tracking_id   BIGINT NOT NULL auto_increment,
    state                   TINYINT NOT NULL default 1,
    incidence_id            BIGINT NOT NULL,
    user_id                 BIGINT NOT NULL,
    created_at              DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at               DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at               DATETIME,
    PRIMARY KEY (incidence_tracking_id)
);

DROP TABLE IF EXISTS locations;
CREATE TABLE locations(
    location_id     BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    user_id         BIGINT NOT NULL,
    name            VARCHAR(100) NOT NULL,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (location_id)
);

DROP TABLE IF EXISTS modules;
CREATE TABLE modules(
    module_id       BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    name            VARCHAR(100) NOT NULL,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (module_id)
);

DROP TABLE IF EXISTS parameters;
CREATE TABLE parameters(
    parameter_id    BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    name            VARCHAR(100) NOT NULL,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (parameter_id)
);

DROP TABLE IF EXISTS parameters_value;
CREATE TABLE parameters_value(
    parameter_value_id  BIGINT NOT NULL auto_increment,
    state               TINYINT NOT NULL default 1,
    value               TEXT NOT NULL,
    parameter_id        BIGINT NOT NULL,
    created_at          DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at           DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at           DATETIME,
    PRIMARY KEY (parameter_value_id)
);

DROP TABLE IF EXISTS perfils;
CREATE TABLE perfils(
    perfil_id       BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    name            VARCHAR(100) NOT NULL,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (perfil_id)
);

DROP TABLE IF EXISTS permissions;
CREATE TABLE permissions(
    permission_id   BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    user_id         BIGINT NOT NULL,
    accion_id       BIGINT NOT NULL,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (permission_id)
);

DROP TABLE IF EXISTS petition_types;
CREATE TABLE petition_types(
    petition_type_id    BIGINT NOT NULL auto_increment,
    state               TINYINT NOT NULL default 1,
    name                VARCHAR(100) NOT NULL,
    created_at          DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at           DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at           DATETIME,
    PRIMARY KEY (petition_type_id)
);

DROP TABLE IF EXISTS petitions;
CREATE TABLE petitions(
    petition_id         BIGINT NOT NULL auto_increment,
    state               TINYINT NOT NULL default 1,
    user_id             BIGINT NOT NULL,
    petition_type_id    BIGINT NOT NULL,
    title               VARCHAR(100) NOT NULL,
    description         TEXT NOT NULL,
    created_at          DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at           DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at           DATETIME,
    PRIMARY KEY (petition_id)
);

DROP TABLE IF EXISTS petitions_tracking;
CREATE TABLE petitions_tracking(
    petition_tracking_id    BIGINT NOT NULL auto_increment,
    state                   TINYINT NOT NULL default 1,
    petition_id             BIGINT NOT NULL,
    user_id                 BIGINT NOT NULL,
    comemnt                 TEXT NOT NULL,
    created_at              DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at               DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at               DATETIME,
    PRIMARY KEY (petition_tracking_id)
);

DROP TABLE IF EXISTS recovery_passwords;
CREATE TABLE recovery_passwords(
    recovery_password_id    BIGINT NOT NULL auto_increment,
    state                   TINYINT NOT NULL default 1,
    user_id                 BIGINT NOT NULL,
    token                   VARCHAR(100) NOT NULL,
    progress                VARCHAR(7) NOT NULL,
    created_at              DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at               DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at               DATETIME,
    PRIMARY KEY (recovery_password_id)
);

DROP TABLE IF EXISTS schedules;
CREATE TABLE schedules(
    schedule_id     BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    device_id       BIGINT NOT NULL,
    date            DATE NOT NULL,
    time            TIME NOT NULL,
    repetition      TINYINT NOT NULL,
    `interval`        INT NOT NULL,
    duration        INT NOT NULL,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (schedule_id)
);

DROP TABLE IF EXISTS states;
CREATE TABLE states(
    state_id        BIGINT NOT NULL auto_increment,
    state           TINYINT NOT NULL default 1,
    name            VARCHAR(100) NOT NULL,
    country_id      BIGINT NOT NULL,
    created_at      DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at       DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at       DATETIME,
    PRIMARY KEY (state_id)
);

DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id                      BIGINT NOT NULL auto_increment,
    perfil_id               BIGINT NOT NULL default 2,
    name                    VARCHAR(255) NOT NULL,
    lastname                VARCHAR(255) NOT NULL,
    email                   VARCHAR(255) NOT NULL,
    encrypted_password      VARCHAR(255) NOT NULL,
    reset_password_token    VARCHAR(255) NOT NULL,
    reset_password_sent_at  DATETIME,
    remember_created_at     DATETIME,
    sign_in_count           INT NOT NULL DEFAULT 0,
    current_sign_in_at      DATETIME,
    last_sign_in_at         DATETIME,
    current_sign_in_ip      VARCHAR(255),
    last_sign_in_ip         VARCHAR(255),
    created_at              DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at               DATETIME NOT NULL default CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS users_desc;
CREATE TABLE users_desc(
    user_desc_id        BIGINT NOT NULL auto_increment,
    state               TINYINT NOT NULL default 1,
    sex_id              BIGINT NOT NULL,
    city_residence_id   BIGINT NOT NULL,
    phone               VARCHAR(20) NOT NULL,
    address             VARCHAR(200) NOT NULL,
    cell_phone          VARCHAR(100) NOT NULL,
    birth_date          DATE NOT NULL,
    user_id             BIGINT NOT NULL,
    created_at          DATETIME NOT NULL default CURRENT_TIMESTAMP,
    update_at           DATETIME NOT NULL default CURRENT_TIMESTAMP,
    delete_at           DATETIME,
    PRIMARY KEY (user_desc_id)
);