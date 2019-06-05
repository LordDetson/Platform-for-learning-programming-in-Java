INSERT INTO `user` (`id`, `active`, `email`, `password`, `username`)
VALUES ('0', 1, 'admin@admin.com', '$2a$08$LmkgXSW7/A7OMaqsJToN6.G1rqdgPFoZ9/15OrHa2vcDNzkIwhK5e', 'admin');

INSERT INTO `user_role` (`user_id`, `roles`)
VALUES ('0', 'USER'), ('0', 'TEACHER'), ('0', 'ADMIN');

INSERT INTO `user` (`id`, `active`, `email`, `password`, `username`)
VALUES ('1', 1, 'teacher@teacher.com', '$2a$08$aRxp9Nzy00Tr3RGeS5NPEuqgMdvUFPU3nwngrh2BmFhhMsA4EYAxu', 'teacher');

INSERT INTO `user_role` (`user_id`, `roles`)
VALUES ('1', 'USER'), ('1', 'TEACHER');

INSERT INTO `user` (`id`, `active`, `email`, `password`, `username`)
VALUES ('2', 1, 'user@user.com', '$2a$08$Hlh/wQB/iKnchS1cjuc42eZ6dsX.YJ/AArYZXlSnUMHISHF8WbExa', 'user');

INSERT INTO `user_role` (`user_id`, `roles`)
VALUES ('2', 'USER');