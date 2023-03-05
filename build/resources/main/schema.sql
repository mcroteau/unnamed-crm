create table users (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    uid character varying(254),
    guid character varying(254),
    ref character varying(254),
    refs text,
    name character varying(155) NOT NULL,
    phone character varying(40),
    email character varying(254) NOT NULL,
    passwd character varying(155) NOT NULL,
    image text,
    time_created bigint default 0
);

create table roles (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    name character varying(155) NOT NULL UNIQUE
);

create table user_permissions(
    user_id bigint REFERENCES users(id),
    permission character varying(55)
);

create table user_roles(
    role_id bigint NOT NULL REFERENCES roles(id),
    user_id bigint NOT NULL REFERENCES users(id)
);

create table nations (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    name character varying(254) NOT NULL,
    iso character varying(254) NOT NULL,
    iso3 character varying(254) NOT NULL,
    numeric_code character varying(254),
    phone_code character varying(254),
    capital character varying(254),
    currency character varying(254),
    currency_name character varying(254),
    currency_symbol character varying(254),
    native_name character varying(254),
    region character varying(254),
    subregion character varying(254),
    lat decimal,
    lng decimal,
    emoji character varying(254) NOT NULL
);

create table states (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    code character varying(254),
    name character varying(254) NOT NULL,
    lat decimal,
    lng decimal,
    nation_id bigint NOT NULL REFERENCES nations(id)
);

create table towns (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    code character varying(254) NOT NULL,
    name character varying(254) NOT NULL,
    lat decimal,
    lng decimal,
    state_id bigint NOT NULL REFERENCES states(id),
    nation_id bigint NOT NULL REFERENCES nations(id)
);

create table companies (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    uid character varying(154),
    guid character varying(154),
    name character varying(253) NOT NULL,
    phones text,
    emails text,
    image clob,
    stripe_customer_id text
);

create table clients(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    uid character varying(254),
    guid character varying(254),
    name character varying(155) NOT NULL,
    phone character varying(40),
    email character varying(254) NOT NULL,
    passwd character varying(155) NOT NULL,
    company_id bigint NOT NULL REFERENCES companies(id),
    time_created bigint default 0,
    lat decimal,
    lng decimal,
    status character varying(251)
);

create table client_activities(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    client_id bigint NOT NULL REFERENCES clients(id),
    google_activity_id text
);

create table client_activity_attendees(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    attendee_id bigint NOT NULL REFERENCES users(id),
);

create table client_comments(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    comment text,
    client_id bigint NOT NULL REFERENCES clients(id),
    user_id bigint NOT NULL REFERENCES users(id),
    time_created bigint
);

create table client_addresses(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    client_id bigint NOT NULL REFERENCES clients(id),
    street character varying(254),
    street_dos character varying(254),
    town_id bigint NOT NULL REFERENCES towns(id),
    state_id bigint NOT NULL REFERENCES states(id),
    nation_id bigint NOT NULL REFERENCES nations(id),
    zip character varying(251)
);

create table client_contacts(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    name character varying(155) NOT NULL,
    phone character varying(40),
    email character varying(254) NOT NULL
);

create table client_synchonized(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    client_id bigint NOT NULL REFERENCES clients(id),
    user_id bigint NOT NULL REFERENCES users(id)
);

create table client_contact_synchonized(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    client_contact_id bigint NOT NULL REFERENCES client_contacts(id),
    user_id bigint NOT NULL REFERENCES users(id)
);