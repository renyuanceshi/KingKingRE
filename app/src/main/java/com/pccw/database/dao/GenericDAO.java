package com.pccw.database.dao;

import java.util.ArrayList;

public interface GenericDAO<E, K> {
    void add(E e);

    void close();

    E find(K k);

    ArrayList<E> list();

    void open();

    void remove(E e);

    int update(E e);
}
