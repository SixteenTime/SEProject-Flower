/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/11/5 8:19:06                            */
/*==============================================================*/


drop table if exists ARTICLE_ARTICLETYPE;

drop table if exists Article;

drop table if exists ArticleType;

drop table if exists Comment;

drop table if exists FollowUser;

drop table if exists Plant;

drop table if exists USER_FOLLOWUSER;

drop table if exists USER_PLANT;

drop table if exists User;

/*==============================================================*/
/* Table: ARTICLE_ARTICLETYPE                                   */
/*==============================================================*/
create table ARTICLE_ARTICLETYPE
(
   ANo                  varchar(20) not null,
   ATNo                 varchar(5) not null,
   primary key (ANo, ATNo)
);

/*==============================================================*/
/* Table: Article                                               */
/*==============================================================*/
create table Article
(
   ANo                  varchar(20) not null,
   UNo                  varchar(10),
   Acontent             varchar(10000) not null,
   APicture1            varchar(100),
   APicture2            varchar(100),
   APicture3            varchar(100),
   APicture4            varchar(100),
   ABrowseNumber        int,
   ALikeNumber          int,
   ATime                datetime not null,
   primary key (ANo)
);

/*==============================================================*/
/* Table: ArticleType                                           */
/*==============================================================*/
create table ArticleType
(
   ATNo                 varchar(5) not null,
   ATName               varchar(30) not null,
   primary key (ATNo)
);

/*==============================================================*/
/* Table: Comment                                               */
/*==============================================================*/
create table Comment
(
   CNo                  varchar(30) not null,
   ANo                  varchar(20),
   UNo                  varchar(10),
   CConent              varchar(1000) not null,
   primary key (CNo)
);

/*==============================================================*/
/* Table: FollowUser                                            */
/*==============================================================*/
create table FollowUser
(
   FUNo                 varchar(10) not null,
   FUName               varchar(60) not null,
   FUGender             int not null,
   FUSignature          varchar(50),
   primary key (FUNo)
);

/*==============================================================*/
/* Table: Plant                                                 */
/*==============================================================*/
create table Plant
(
   PNo                  varchar(30) not null,
   PName                varchar(50) not null,
   PPoem                varchar(1000) not null,
   primary key (PNo)
);

/*==============================================================*/
/* Table: USER_FOLLOWUSER                                       */
/*==============================================================*/
create table USER_FOLLOWUSER
(
   UNo                  varchar(10) not null,
   FUNo                 varchar(10) not null,
   primary key (UNo, FUNo)
);

/*==============================================================*/
/* Table: USER_PLANT                                            */
/*==============================================================*/
create table USER_PLANT
(
   UNo                  varchar(10) not null,
   PNo                  varchar(30) not null,
   primary key (UNo, PNo)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   UNo                  varchar(10) not null,
   UName                varchar(60) not null,
   UGender              int not null,
   USignature           varchar(50),
   primary key (UNo)
);

alter table ARTICLE_ARTICLETYPE add constraint FK_ARTICLE_ARTICLETYPE foreign key (ANo)
      references Article (ANo) on delete restrict on update restrict;

alter table ARTICLE_ARTICLETYPE add constraint FK_ARTICLE_ARTICLETYPE2 foreign key (ATNo)
      references ArticleType (ATNo) on delete restrict on update restrict;

alter table Article add constraint FK_USER_ARTICLE foreign key (UNo)
      references User (UNo) on delete restrict on update restrict;

alter table Comment add constraint FK_ARTICLE_COMMENT foreign key (ANo)
      references Article (ANo) on delete restrict on update restrict;

alter table Comment add constraint FK_USER_COMMENT foreign key (UNo)
      references User (UNo) on delete restrict on update restrict;

alter table USER_FOLLOWUSER add constraint FK_USER_FOLLOWUSER foreign key (UNo)
      references User (UNo) on delete restrict on update restrict;

alter table USER_FOLLOWUSER add constraint FK_USER_FOLLOWUSER2 foreign key (FUNo)
      references FollowUser (FUNo) on delete restrict on update restrict;

alter table USER_PLANT add constraint FK_USER_PLANT foreign key (UNo)
      references User (UNo) on delete restrict on update restrict;

alter table USER_PLANT add constraint FK_USER_PLANT2 foreign key (PNo)
      references Plant (PNo) on delete restrict on update restrict;

