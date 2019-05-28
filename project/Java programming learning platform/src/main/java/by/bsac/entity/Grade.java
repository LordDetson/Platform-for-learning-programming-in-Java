package by.bsac.entity;

import by.bsac.entity.test.Practice;
import by.bsac.entity.test.Test;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
public class Grade {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
    private Short grade;
    private LocalDate date;

    @OneToOne
    @JoinColumn(name = "test_id")
    private Test test;

    @OneToOne
    @JoinColumn(name = "practice_id")
    private Practice practice;
}
