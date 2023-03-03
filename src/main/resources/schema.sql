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

create table company (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    uid character varying(154),
    guid character varying(154),
    name character varying(253) NOT NULL,
    phones text,
    emails text,
    image clob,
    stripe_customer_id text
);

create table client (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    uid character varying(254),
    guid character varying(254),
    name character varying(155) NOT NULL,
    phone character varying(40),
    email character varying(254) NOT NULL,
    passwd character varying(155) NOT NULL,
    time_created bigint default 0
);