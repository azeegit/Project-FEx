package com.b1080265.ProjectFEx.gameTheory;

import com.b1080265.ProjectFEx.entities.Campaign;
import com.b1080265.ProjectFEx.entities.Startup;

public class Player {
    private String name;

    public Player(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Startup getStartup() {
        return null;
    }

    public Strategy[] getAvailableStrategies() {
        return null;
    }
}
