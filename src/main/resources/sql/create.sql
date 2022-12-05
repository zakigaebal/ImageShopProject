CREATE TABLE code_group (
                            group_code CHAR(3) NOT NULL,
                            group_name VARCHAR(30) NOT NULL,
                            use_yn CHAR(1) NOT NULL DEFAULT 'Y',
                            reg_date DATETIME,
                            upd_date DATETIME,
                            PRIMARY KEY (group_code)
);

CREATE TABLE code_detail (
                             group_code CHAR(3) NOT NULL,
                             code_value VARCHAR(3) NOT NULL,
                             code_name VARCHAR(30) NOT NULL,
                             sort_seq INTEGER NOT NULL,
                             use_yn CHAR(1) NOT NULL DEFAULT 'Y',
                             reg_date DATETIME,
                             upd_date DATETIME,
                             PRIMARY KEY (group_code, code_value)
);

CREATE TABLE member(
                       user_no BIGINT NOT NULL AUTO_INCREMENT,
                       user_id VARCHAR(50) NOT NULL,
                       user_pw VARCHAR(100) NOT NULL,
                       user_name VARCHAR(100) NOT NULL,
                       job VARCHAR(3) NOT NULL DEFAULT '00',
                       coin INTEGER DEFAULT 0,
                       reg_date DATETIME,
                       upd_date DATETIME,
                       PRIMARY KEY (user_no)
);

CREATE TABLE member_auth (
                             user_auth_no BIGINT NOT NULL AUTO_INCREMENT,
                             user_no BIGINT NOT NULL,
                             auth VARCHAR(50) NOT NULL,
                             reg_date DATETIME,
                             upd_date DATETIME,
                             PRIMARY KEY (user_auth_no)
);

ALTER TABLE member_auth ADD CONSTRAINT fk_member_auth_user_no
    FOREIGN KEY (user_no) REFERENCES member(user_no);

CREATE TABLE board (
                       board_no BIGINT NOT NULL AUTO_INCREMENT,
                       title VARCHAR(200) NOT NULL,
                       content TEXT,
                       writer VARCHAR(50) NOT NULL,
                       reg_date DATETIME,
                       upd_date DATETIME,
                       PRIMARY KEY (board_no)
);

CREATE TABLE notice (
                        notice_no BIGINT NOT NULL AUTO_INCREMENT,
                        title VARCHAR(200) NOT NULL,
                        content TEXT,
                        reg_date DATETIME,
                        upd_date DATETIME,
                        PRIMARY KEY (notice_no)
);

CREATE TABLE item(
                     item_id BIGINT NOT NULL AUTO_INCREMENT,
                     item_name VARCHAR(20) NOT NULL,
                     price INTEGER NOT NULL,
                     description VARCHAR(50),
                     picture_url VARCHAR(200),
                     preview_url VARCHAR(200),
                     reg_date DATETIME,
                     upd_date DATETIME,
                     PRIMARY KEY (item_id)
);

CREATE TABLE user_item (
                           user_item_no BIGINT NOT NULL AUTO_INCREMENT,
                           user_no BIGINT NOT NULL,
                           item_id BIGINT NOT NULL,
                           reg_date DATETIME,
                           upd_date DATETIME,
                           PRIMARY KEY (user_item_no)
);

CREATE TABLE pds(
                    item_id BIGINT NOT NULL AUTO_INCREMENT,
                    item_name VARCHAR(20),
                    view_cnt INTEGER,
                    description VARCHAR(50),
                    reg_date DATETIME,
                    upd_date DATETIME,
                    PRIMARY KEY (item_id)
);

CREATE TABLE pds_file (
                          pds_file_id BIGINT NOT NULL AUTO_INCREMENT,
                          full_name VARCHAR(200) NOT NULL,
                          item_id BIGINT NOT NULL,
                          down_cnt INTEGER,
                          reg_date DATETIME,
                          upd_date DATETIME,
                          PRIMARY KEY(pds_file_id)
);

ALTER TABLE pds_file ADD CONSTRAINT fk_pds_file_item_id
    FOREIGN KEY (item_id) REFERENCES pds(item_id);

CREATE TABLE charge_coin_history (
                                     history_no BIGINT NOT NULL AUTO_INCREMENT,
                                     user_no BIGINT NOT NULL,
                                     amount INTEGER NOT NULL,
                                     reg_date DATETIME,
                                     upd_date DATETIME,
                                     PRIMARY KEY (history_no)
);

CREATE TABLE pay_coin_history (
                                  history_no BIGINT NOT NULL AUTO_INCREMENT,
                                  user_no BIGINT NOT NULL,
                                  item_id BIGINT NOT NULL,
                                  amount INTEGER NOT NULL,
                                  reg_date DATETIME,
                                  upd_date DATETIME,
                                  PRIMARY KEY (history_no)
);

CREATE TABLE access_log (
                            log_no BIGINT NOT NULL AUTO_INCREMENT,
                            request_uri VARCHAR(200) NOT NULL,
                            class_name VARCHAR(100) NOT NULL,
                            class_simple_name VARCHAR(50) NOT NULL,
                            method_name VARCHAR(100) NOT NULL,
                            remote_addr VARCHAR(50) NOT NULL,
                            reg_date DATETIME,
                            upd_date DATETIME,
                            PRIMARY KEY (log_no)
);

CREATE TABLE performance_log (
                                 log_no BIGINT NOT NULL AUTO_INCREMENT,
                                 signature_name VARCHAR(50) NOT NULL,
                                 signature_type_name VARCHAR(100) NOT NULL,
                                 duration_time BIGINT DEFAULT 0,
                                 reg_date DATETIME,
                                 upd_date DATETIME,
                                 PRIMARY KEY (log_no)
);
