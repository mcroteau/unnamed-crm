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
    onboarded boolean default false,
    stripe_customer_id text,
    has_bank boolean default false,
    has_cell boolean default false,
    time_created bigint default 0,
    sponsor boolean default false
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
