package org.example.entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import jakarta.persistence.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity(name = "Review")
@Table(name = "review", schema = "bookshopweb")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ReviewID", nullable = false)
    private Integer reviewID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "AccountID")
    @JsonIgnore
    private Account accountID;

    @Column(name = "Point")
    private Integer point;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "BookID")
    @JsonIgnore
    private Book bookID;

    @Column(name = "Comment")
    private String comment;
}