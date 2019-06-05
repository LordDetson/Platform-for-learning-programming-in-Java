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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Short getGrade() {
        return grade;
    }

    public void setGrade(Short grade) {
        this.grade = grade;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }

    public Practice getPractice() {
        return practice;
    }

    public void setPractice(Practice practice) {
        this.practice = practice;
    }
}
