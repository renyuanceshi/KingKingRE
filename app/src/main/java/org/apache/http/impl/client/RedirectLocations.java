package org.apache.http.impl.client;

import java.net.URI;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
public class RedirectLocations extends AbstractList<Object> {
    private final List<URI> all = new ArrayList();
    private final Set<URI> unique = new HashSet();

    public void add(int i, Object obj) {
        this.all.add(i, (URI) obj);
        this.unique.add((URI) obj);
    }

    public void add(URI uri) {
        this.unique.add(uri);
        this.all.add(uri);
    }

    public boolean contains(Object obj) {
        return this.unique.contains(obj);
    }

    public boolean contains(URI uri) {
        return this.unique.contains(uri);
    }

    public URI get(int i) {
        return this.all.get(i);
    }

    public List<URI> getAll() {
        return new ArrayList(this.all);
    }

    public URI remove(int i) {
        URI remove = this.all.remove(i);
        this.unique.remove(remove);
        if (this.all.size() != this.unique.size()) {
            this.unique.addAll(this.all);
        }
        return remove;
    }

    public boolean remove(URI uri) {
        boolean remove = this.unique.remove(uri);
        if (remove) {
            Iterator<URI> it = this.all.iterator();
            while (it.hasNext()) {
                if (it.next().equals(uri)) {
                    it.remove();
                }
            }
        }
        return remove;
    }

    public Object set(int i, Object obj) {
        URI uri = this.all.set(i, (URI) obj);
        this.unique.remove(uri);
        this.unique.add((URI) obj);
        if (this.all.size() != this.unique.size()) {
            this.unique.addAll(this.all);
        }
        return uri;
    }

    public int size() {
        return this.all.size();
    }
}
