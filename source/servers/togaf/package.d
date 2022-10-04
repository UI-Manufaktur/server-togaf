module servers.togaf;

@safe:
mixin ImportPhobos;
mixin ImportDubs;
mixin ImportUim;

public import colored;

// Additional imports
public import uim.jsonbase;
public import uim.entities;
public import uim.entitybase;
public import uim.apps;
public import uim.servers;
public import uim.mvc;

// server-ecm packages
public import servers.togaf.controllers;
public import servers.togaf.layouts;
public import servers.togaf.views;

public import models.systems;
public import models.togaf;

public import layouts.tabler;

// mixin(ImportLocal!("ecm"));

DMVCApplication thisApplication;
string[size_t] errorMessages;
static this() {
  thisApplication = MVCApplication
    .rootPath("/")
    .layout(new DTGFGeneralLayout)
    .addRoute(MVCRoute("index",       HTTPMethod.GET, TGFIndexPageController.layout(new DTGFGeneralLayout)))
    // Routing for GBBs
    .addRoute(MVCRoute("gbbs",        HTTPMethod.GET, TGFGbbIndexPageController))
    .addRoute(MVCRoute("gbbs/create", HTTPMethod.GET, TGFGbbCreatePageController))
    .addRoute(MVCRoute("gbbs/create_action", HTTPMethod.POST, TGFGbbCreateActionController))
    .addRoute(MVCRoute("gbbs/read",   HTTPMethod.GET, TGFGbbReadPageController))
    .addRoute(MVCRoute("gbbs/update", HTTPMethod.GET, TGFGbbUpdatePageController))
    .addRoute(MVCRoute("gbbs/update_action", HTTPMethod.POST, TGFGbbUpdateActionController))
    .addRoute(MVCRoute("gbbs/delete", HTTPMethod.GET, TGFGbbDeletePageController))
    .addRoute(MVCRoute("gbbs/delete_action", HTTPMethod.POST, TGFGbbDeleteActionController))
    // Routing for ABBs    
    .addRoute(MVCRoute("abbs",        HTTPMethod.GET, TGFAbbIndexPageController))
    .addRoute(MVCRoute("abbs/create", HTTPMethod.GET, TGFAbbCreatePageController))
    .addRoute(MVCRoute("abbs/create_action", HTTPMethod.POST, TGFAbbCreateActionController))
    .addRoute(MVCRoute("abbs/read",   HTTPMethod.GET, TGFAbbReadPageController))
    .addRoute(MVCRoute("abbs/update", HTTPMethod.GET, TGFAbbUpdatePageController))
    .addRoute(MVCRoute("abbs/update_action", HTTPMethod.POST, TGFAbbUpdateActionController))
    .addRoute(MVCRoute("abbs/delete", HTTPMethod.GET, TGFAbbDeletePageController))
    .addRoute(MVCRoute("abbs/delete_action", HTTPMethod.POST, TGFAbbDeleteActionController))
    // Routing for LBBs
    .addRoute(MVCRoute("lbbs",        HTTPMethod.GET, TGFLbbIndexPageController))
    .addRoute(MVCRoute("lbbs/create", HTTPMethod.GET, TGFLbbCreatePageController))
    .addRoute(MVCRoute("lbbs/create_action", HTTPMethod.POST, TGFLbbCreateActionController))
    .addRoute(MVCRoute("lbbs/read",   HTTPMethod.GET, TGFLbbReadPageController))
    .addRoute(MVCRoute("lbbs/update", HTTPMethod.GET, TGFLbbUpdatePageController))
    .addRoute(MVCRoute("lbbs/update_action", HTTPMethod.POST, TGFLbbUpdateActionController))
    .addRoute(MVCRoute("lbbs/delete", HTTPMethod.GET, TGFLbbDeletePageController))
    .addRoute(MVCRoute("lbbs/delete_action", HTTPMethod.POST, TGFLbbDeleteActionController));
}