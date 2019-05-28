package by.bsac.entity;

import by.bsac.entity.test.Practice;

import javax.persistence.*;

@Entity
public class Document {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String filename;

    @Enumerated(EnumType.STRING)
    private DocumentType type;

    @OneToOne(mappedBy = "document")
    private Message message;

    @OneToOne(mappedBy = "document")
    private Practice practice;
}
