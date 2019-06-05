create table answer (
    id bigint not null,
    content varchar(255) not null,
    is_right bit not null,
    primary key (id)) engine=InnoDB;

create table course (
    id bigint not null,
    active bit,
    description varchar(255),
    img_name varchar(255),
    name varchar(60) not null,
    primary key (id)) engine=InnoDB;

create table course_student (
    course_id bigint not null,
    student_id bigint not null,
    primary key (student_id, course_id)) engine=InnoDB;

create table document (
    id bigint not null,
    filename varchar(255) not null,
    type varchar(30),
    primary key (id)) engine=InnoDB;

create table editor_course (
    course_id bigint not null,
    teacher_id bigint not null,
    primary key (teacher_id, course_id)) engine=InnoDB;

create table grade (
    id bigint not null,
    date date not null,
    grade smallint,
    practice_id bigint,
    test_id bigint,
    user_id bigint not null,
    primary key (id)) engine=InnoDB;

create table hibernate_sequence (next_val bigint) engine=InnoDB;
insert into hibernate_sequence values ( 3 );
insert into hibernate_sequence values ( 3 );
insert into hibernate_sequence values ( 3 );
insert into hibernate_sequence values ( 3 );
insert into hibernate_sequence values ( 3 );
insert into hibernate_sequence values ( 3 );
insert into hibernate_sequence values ( 3 );
insert into hibernate_sequence values ( 3 );
insert into hibernate_sequence values ( 3 );
insert into hibernate_sequence values ( 3 );
insert into hibernate_sequence values ( 3 );
insert into hibernate_sequence values ( 3 );

create table message (
    id bigint not null,
    date datetime,
    text varchar(2000),
    title varchar(40),
    document_id bigint,
    from_user_id bigint,
    to_user_id bigint,
    primary key (id)) engine=InnoDB;

create table page (
    id bigint not null,
    name varchar(80) not null,
    path varchar(255),
    priority integer not null,
    topic_id bigint not null,
    primary key (id)) engine=InnoDB;

create table practice (
    id bigint not null,
    content varchar(5000),
    name varchar(80) not null,
    document_id bigint,
    primary key (id)) engine=InnoDB;

create table question (
    id bigint not null,
    content varchar(5000),
    primary key (id)) engine=InnoDB;

create table question_id (
    question_id bigint,
    id bigint not null,
    primary key (id)) engine=InnoDB;

create table question_teg (
    question_id bigint not null,
    tag_id bigint not null,
    primary key (tag_id, question_id)) engine=InnoDB;

create table tag (
    id bigint not null,
    name varchar(40) not null,
    primary key (id)) engine=InnoDB;

create table test (
    id bigint not null,
    name varchar(255) not null,
    primary key (id)) engine=InnoDB;

create table test_question (
    test_id bigint not null,
    question_id bigint not null,
    primary key (question_id, test_id)) engine=InnoDB;

create table test_tag (
    test_id bigint not null,
    tag_id bigint not null,
    primary key (tag_id, test_id)) engine=InnoDB;

create table topic (
    id bigint not null,
    name varchar(80) not null,
    priority integer not null,
    course_id bigint not null,
    primary key (id)) engine=InnoDB;

create table user (
    id bigint not null,
    activation_code varchar(255),
    active bit not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(50) not null,
    primary key (id)) engine=InnoDB;

create table user_role (
    user_id bigint not null,
    roles varchar(20)) engine=InnoDB;

alter table course_student add constraint FK2sxaxgn2f7wv33s5a91wm0uuk foreign key (student_id) references user (id);
alter table course_student add constraint FKlmj50qx9k98b7li5li74nnylb foreign key (course_id) references course (id);
alter table editor_course add constraint FKsnnfwx6f4yjv1ejdkx8ngque9 foreign key (teacher_id) references user (id);
alter table editor_course add constraint FK70rqdhjnqukinim71cfww9ni7 foreign key (course_id) references course (id);
alter table grade add constraint FKtn6oevi9tl2r1tflefqv75li foreign key (practice_id) references practice (id);
alter table grade add constraint FK12gw3f2v7e10u4xnhskl58xcn foreign key (test_id) references test (id);
alter table grade add constraint FKasgj3xfoi6sd5ghc8psbueb64 foreign key (user_id) references user (id);
alter table message add constraint FKergo0p2trclws6pqqfhofoxdt foreign key (document_id) references document (id);
alter table message add constraint FK3nju8asf4v72h0d7g6vgtx7p2 foreign key (from_user_id) references user (id);
alter table message add constraint FKgm8awic1hpa2cgr7pv7j8yn0 foreign key (to_user_id) references user (id);
alter table page add constraint FKfj8g294b42gqcv3882kpsh63t foreign key (topic_id) references topic (id);
alter table practice add constraint FKergco7ge3hx76rkjjsev088m2 foreign key (document_id) references document (id);
alter table question_id add constraint FKdt20fycxo4tlmk25i7l7ck82k foreign key (question_id) references question (id);
alter table question_id add constraint FKk8r6reb0p1ghg8tsm367llq08 foreign key (id) references answer (id);
alter table question_teg add constraint FK6y5tg20bmh07ha1i1nw1iden2 foreign key (tag_id) references question (id);
alter table question_teg add constraint FK3hsat76j6e767s4iqbvqdqwct foreign key (question_id) references tag (id);
alter table test_question add constraint FKalva6fesmd2e4a5r6mu1uhgk1 foreign key (question_id) references test (id);
alter table test_question add constraint FK1dk634wf1l68u2nyb9mrl412x foreign key (test_id) references question (id);
alter table test_tag add constraint FKlpgyel5ukrq6fwbut0x1tf1y7 foreign key (tag_id) references test (id);
alter table test_tag add constraint FKjrpd5twlpe3rno45hkt9984p6 foreign key (test_id) references tag (id);
alter table topic add constraint FKtktaeeogyyjfv5ylr4r06ig1l foreign key (course_id) references course (id);
alter table user_role add constraint FK859n2jvi8ivhui0rl0esws6o foreign key (user_id) references user (id);