module servers.togaf.layouts.general;

@safe:
import servers.togaf;

class DTGFGeneralLayout : DMVCLayout {
  this() {
    initialize(); }

  override void initialize() {
    debug writeln("Initialize 'TGFGeneralLayout'"); 
 
    // Default settings
    this
      .name("TGFGeneralLayout")
      .title("UI Manufaktur")
      .bodyAttributes(["style": "background-color: #ffffff;"])
      .layoutStyle("tabler")
      .links(MVCLinkContainer) 
      .metas(MVCMetaContainer) 
      .scripts(MVCScriptContainer)
      .styles(MVCStyleContainer); 

    debug writeln("Select Style"); 
    if (layoutStyle == "tabler") {
      this.styles.addLinks(
        "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css",
        "https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap",
        "/lib/tabler/last/css/tabler.min.css",
        "/lib/tabler/last/css/tabler-flags.min.css",
        "/lib/tabler/last/css/tabler-payments.min.css",
        "/lib/tabler/last/css/tabler-vendors.min.css");

      this.scripts.addLinks(
        "/lib/apexcharts/last/apexcharts.min.js",
        "/lib/tabler/last/js/tabler.min.js");
    }
    
    // Add meta
    this.metas.add(
      ["charset":"utf-8"],
      ["http-equiv":"X-UA-Compatible", "content":"IE=edge"],
      ["name":"viewport", "content":"width=device-width, initial-scale=1"], 
      ["http-equiv":"Content-Type", "content":"text/html; charset=utf-8"],
      ["name":"msapplication-TileColor", "content":"#ffffff"],
      ["name":"msapplication-TileImage", "content":"/ms-icon-144x144.png"],
      ["name":"theme-color", "content":"#ffffff"]      
      //["rel":"icon", "type":"image/ico", "href":"/img/favicon.ico"],
      );

    debug writeln("Add styles"); 
    this.styles.addLinks(
      "/lib/kothing/last/kothing-editor.min.css",
      "/lib/katex/last/katex.min.css",
      "/css/apps/application.css",
      "/css/apps/cms/main.css");

    debug writeln("Add scripts"); 
    this.scripts.addLinks(
      "/lib/kothing/last/kothing-editor.min.js",
      "/lib/katex/last/katex.min.js",
      "/js/apps/application.js");

    _bodyAttributes["style"] = "background-color: #ffffff;";
    _bodyClasses = ["d-flex", "flex-column", "h-100"];

    debug writeln("Add navigation"); 
    this
      .navigation(
        MVCNavigation.fixedTop(true));

    debug writeln("Add footer"); 
    this    
      .footer(
        MVCPageFooter);
  }

	override string render(DMVCPageController controller, string content, STRINGAA options = null) { 
		debugMethodCall(moduleName!DTGFGeneralLayout~":DTGFGeneralLayout("~this.name~")::render(DMVCPageController controller, string content, STRINGAA options = null)");
		beforeRender(options);

		// 1. page parameters to options
    if (controller) {
      debug writeln("controller is -> ", controller.name);
		  foreach(k,v; controller.parameters) options[k] = v; 
    }
    else { debug writeln("No controller"); }

		// 2. layout parameters to options
		foreach(k,v; parameters) if (k !in options) options[k] = v;
		// 3. app parameters to options
		
		if (application) {
			options["rootPath"] = application.rootPath;      
			foreach(k,v; application.parameters) if (k !in options) options[k] = v; }

    DH5Obj[] actualMetas;
    DH5Obj[] actualLinks;
    DH5Obj[] actualStyles;
		DH5Obj[] actualScripts;

		if (application) {
      debug writeln("Found app");

      actualMetas ~= application.metas.toH5;
			actualLinks ~= application.links.toH5;
			actualStyles ~= application.styles.toH5;
			actualScripts ~= application.scripts.toH5;
		} else { debug writeln("No app :-("); }

    actualMetas ~= this.metas.toH5;
    actualLinks ~= this.links.toH5;
    actualStyles ~= this.styles.toH5;
    actualScripts ~= this.scripts.toH5;

		if (auto pageController = cast(DMVCPageController)controller) {
      debug writeln("Found pageController");

      actualMetas ~= pageController.metas.toH5;
			actualLinks ~= pageController.links.toH5;
			actualStyles ~= pageController.styles.toH5;
			actualScripts ~= pageController.scripts.toH5;
		} else { debug writeln("No pageController :-("); }

		// creating HTML page
		auto _html = H5Html
		.attributes("lang", options.get("lang", "en")).attributes("dir", options.get("dir", "ltr"));
		
    // Head part of HTML
    auto headContent = 
      (options.get("title", null) ? "<title>" ~ options.get("title", null) ~ "</title>":null)~
		  (actualMetas.asString~options.get("metas", null))~
		  (actualLinks.asString~options.get("links", null))~
		  ("link" in options ? options["link"] : null)~
		  (actualStyles.asString~options.get("styles", null))~
		  ("style" in options ? H5Style(options["style"]).toString : null);
		renderHead(_html, this.headClasses, this.headAttributes, headContent, options);

		// Body part of HTML
		auto bodyContent = 
    (this.layout ?  this.layout.render(controller, content, options) : content)~
		(actualScripts.asString~options.get("script", null));

		renderBody(_html, this.bodyClasses, this.bodyAttributes, bodyContent, options);

		return _html.toString;
	}
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
		// writeln(H5TGFGeneralLayout);
		// assert(H5TGFGeneralLayout.render == `<!doctype html><html dir="ltr" lang="en"], <head></head><body></body></html>`);
		//assert(H5TGFGeneralLayout()("xxx") == `<!doctype html><html dir="ltr" lang="en"], <head></head><body>xxx</body></html>`);
	}}

  void renderHead(DH5Html html, string[] classes, STRINGAA attributes, string content, STRINGAA options = null) {
    html
    .head(classes)
		.head(attributes)
		.head(content);
  }

  void renderBody(DH5Html html, string[] classes, STRINGAA attributes, string content, STRINGAA options = null) {
    html
    .body_(classes)
		.body_(attributes)
		.body_(content);
  }
  // #endregion render
}

H5Div(["page"], 
      <header class="navbar navbar-expand-md navbar-light d-print-none"], 
        H5Div(["container-xl"], 
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu"], 
            <span class="navbar-toggler-icon"], </span>
          </button>
          <h1 class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3"], 
            H5A( href="."], 
              <img src="./static/logo.svg" width="110" height="32" alt="Tabler" class="navbar-brand-image"], 
            </a>
          </h1>
          H5Div(["navbar-nav flex-row order-md-last"], 
            H5Div(["nav-item d-none d-md-flex me-3"], 
              UIMButtonList( 
                UIMButton(["target":"_blank", "rel":"noreferrer"]).link("https://github.com/tabler/tabler")( 
                  tablerIcon("brand-github")~" Source code"),
                UIMButton(["target":"_blank", "rel":"noreferrer"]).link("https://github.com/sponsors/codecalm")(
                  tablerIcon("heart")~" Sponsor")
              )
            ),
            H5Div(["d-none d-md-flex"], 
              H5A(["nav-link px-0 hide-theme-dark"], ["href":"?theme=dark", "data-bs-toggle":"tooltip", "data-bs-placement":"bottom", "aria-label":"Enable dark mode"], 
                tablerIcon("moon")),                
              H5A(["nav-link px-0 hide-theme-light"], ["href"="?theme=light" class= data-bs-toggle="tooltip" data-bs-placement="bottom" aria-label="Enable light mode"], 
                tablerIcon("sun -->
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><circle cx="12" cy="12" r="4"], </circle><path d="M3 12h1m8 -9v1m8 8h1m-9 8v1m-6.4 -15.4l.7 .7m12.1 -.7l-.7 .7m0 11.4l.7 .7m-12.1 -.7l-.7 .7"], </path></svg>
              </a>
              H5Div(["nav-item dropdown d-none d-md-flex me-3"], 
                H5A(["nav-link px-0"] href="#" class= data-bs-toggle="dropdown" tabindex="-1" aria-label="Show notifications"], 
                  tablerIcon("bell")~UIMBadge(["bg-red"])),
                H5Div(["dropdown-menu dropdown-menu-arrow dropdown-menu-end dropdown-menu-card"], 
                  UIMCARd(H5Div(["card"], 
                    H5Div(["card-header"], 
                      <h3 class="card-title"], Last updates</h3>
                    ),
                    H5Div(["list-group list-group-flush list-group-hoverable"], 
                      H5Div(["list-group-item"], 
                        H5Div(["row align-items-center"], 
                          H5Div(["col-auto"], <span class="status-dot status-dot-animated bg-red d-block"], </span></div>
                          H5Div(["col text-truncate"], 
                            H5A( href="#" class="text-body d-block"], Example 1</a>
                            H5Div(["d-block text-muted text-truncate mt-n1"], 
                              Change deprecated html tags to text decoration classes (#29604)
                            )
                          ),
                          H5Div(["col-auto"], 
                            H5A( href="#" class="list-group-item-actions"], 
                              tablerIcon("star")
                            )
                          )
                        )
                      ),
                      H5Div(["list-group-item"], 
                        H5Div(["row align-items-center"], 
                          H5Div(["col-auto"], <span class="status-dot d-block"], </span></div>
                          H5Div(["col text-truncate"], 
                            H5A( href="#" class="text-body d-block"], Example 2</a>
                            H5Div(["d-block text-muted text-truncate mt-n1"], 
                              justify-content:between ⇒ justify-content:space-between (#29734)
                            )
                          ),
                          H5Div(["col-auto"], 
                            H5A( href="#" class="list-group-item-actions show"], 
                              tablerIcon("star")
                            )
                          )
                        </div>
                      </div>
                      H5Div(["list-group-item"], 
                        H5Div(["row align-items-center"], 
                          H5Div(["col-auto"], <span class="status-dot d-block"], </span></div>
                          H5Div(["col text-truncate"], 
                            H5A( href="#" class="text-body d-block"], Example 3</a>
                            H5Div(["d-block text-muted text-truncate mt-n1"], 
                              Update change-version.js (#29736)
                            </div>
                          </div>
                          H5Div(["col-auto"], 
                            H5A( href="#" class="list-group-item-actions"], 
                              tablerIcon("star -->
                              <svg xmlns="http://www.w3.org/2000/svg" class="icon text-muted" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z"], </path></svg>
                            )
                          )
                        </div>
                      </div>
                      H5Div(["list-group-item"], 
                        H5Div(["row align-items-center"], 
                          H5Div(["col-auto"], <span class="status-dot status-dot-animated bg-green d-block"], </span></div>
                          H5Div(["col text-truncate"], 
                            H5A( href="#" class="text-body d-block"], Example 4</a>
                            H5Div(["d-block text-muted text-truncate mt-n1"], 
                              Regenerate package-lock.json (#29730)
                            </div>
                          </div>
                          H5Div(["col-auto"], 
                            H5A( href="#" class="list-group-item-actions"], 
                              tablerIcon("star -->
                              <svg xmlns="http://www.w3.org/2000/svg" class="icon text-muted" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z"], </path></svg>
                            )
                          )
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            H5Div(["nav-item dropdown"], 
              H5A( href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown" aria-label="Open user menu" aria-expanded="false"], 
                <span class="avatar avatar-sm" style="background-image: url(./static/avatars/000m.jpg)"], </span>
                H5Div(["d-none d-xl-block ps-2"], 
                  <div>Paweł Kuna</div>
                  H5Div(["mt-1 small text-muted"], UI Designer</div>
                </div>
              </a>
              H5Div(["dropdown-menu dropdown-menu-end dropdown-menu-arrow"], 
                H5A( href="#" class="dropdown-item"], Status</a>
                H5A( href="#" class="dropdown-item"], Profile</a>
                H5A( href="#" class="dropdown-item"], Feedback</a>
                H5Div(["dropdown-divider"], </div>
                H5A( href="./settings.html" class="dropdown-item"], Settings</a>
                H5A( href="./sign-in.html" class="dropdown-item"], Logout</a>
              </div>
            </div>
          </div>
        </div>
      </header>
      H5Div(["navbar-expand-md"], 
        H5Div(["collapse navbar-collapse" id="navbar-menu"], 
          H5Div(["navbar navbar-light"], 
            H5Div(["container-xl"], 
              <ul class="navbar-nav"], 
                <li class="nav-item"], 
                  <a class="nav-link" href="./index.html"], 
                    <span class="nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("home -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><polyline points="5 12 3 12 12 3 21 12 19 12"], </polyline><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"], </path><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6"], </path></svg>
                    </span>
                    <span class="nav-link-title"], 
                      Home
                    </span>
                  </a>
                </li>
                <li class="nav-item active dropdown"], 
                  <a class="nav-link dropdown-toggle" href="#navbar-base" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false"], 
                    <span class="nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("package -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><polyline points="12 3 20 7.5 20 16.5 12 21 4 16.5 4 7.5 12 3"], </polyline><line x1="12" y1="12" x2="20" y2="7.5"], </line><line x1="12" y1="12" x2="12" y2="21"], </line><line x1="12" y1="12" x2="4" y2="7.5"], </line><line x1="16" y1="5.25" x2="8" y2="9.75"], </line></svg>
                    </span>
                    <span class="nav-link-title"], 
                      Interface
                    </span>
                  </a>
                  H5Div(["dropdown-menu"], 
                    H5Div(["dropdown-menu-columns"], 
                      H5Div(["dropdown-menu-column"], 
                        <a class="dropdown-item active" href="./empty.html"], 
                          Empty page
                        </a>
                        <a class="dropdown-item" href="./accordion.html"], 
                          Accordion
                        </a>
                        <a class="dropdown-item" href="./blank.html"], 
                          Blank page
                        </a>
                        <a class="dropdown-item" href="./buttons.html"], 
                          Buttons
                        </a>
                        H5Div(["dropend"], 
                          <a class="dropdown-item dropdown-toggle" href="#sidebar-cards" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false"], 
                            Cards
                            <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                          </a>
                          H5Div(["dropdown-menu"], 
                            H5A( href="./cards.html" class="dropdown-item"], 
                              Sample cards
                            </a>
                            H5A( href="./card-actions.html" class="dropdown-item"], 
                              Card actions
                              <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                            </a>
                            H5A( href="./cards-masonry.html" class="dropdown-item"], 
                              Cards Masonry
                            )
                          )
                        </div>
                        <a class="dropdown-item" href="./colors.html"], 
                          Colors
                        </a>
                        <a class="dropdown-item" href="./datagrid.html"], 
                          Data grid
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        <a class="dropdown-item" href="./datatables.html"], 
                          Datatables
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        <a class="dropdown-item" href="./dropdowns.html"], 
                          Dropdowns
                        </a>
                        <a class="dropdown-item" href="./modals.html"], 
                          Modals
                        </a>
                        <a class="dropdown-item" href="./maps.html"], 
                          Maps
                        </a>
                        <a class="dropdown-item" href="./map-fullsize.html"], 
                          Map fullsize
                        </a>
                        <a class="dropdown-item" href="./maps-vector.html"], 
                          Vector maps
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        <a class="dropdown-item" href="./navigation.html"], 
                          Navigation
                        </a>
                        <a class="dropdown-item" href="./charts.html"], 
                          Charts
                        </a>
                      </div>
                      H5Div(["dropdown-menu-column"], 
                        <a class="dropdown-item" href="./pagination.html"], 
                          tablerIcon("pie-chart -->
                          Pagination
                        </a>
                        <a class="dropdown-item" href="./placeholder.html"], 
                          Placeholder
                        </a>
                        <a class="dropdown-item" href="./tabs.html"], 
                          Tabs
                        </a>
                        <a class="dropdown-item" href="./tables.html"], 
                          Tables
                        </a>
                        <a class="dropdown-item" href="./carousel.html"], 
                          Carousel
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        <a class="dropdown-item" href="./lists.html"], 
                          Lists
                        </a>
                        <a class="dropdown-item" href="./typography.html"], 
                          Typography
                        </a>
                        <a class="dropdown-item" href="./offcanvas.html"], 
                          Offcanvas
                        </a>
                        <a class="dropdown-item" href="./markdown.html"], 
                          Markdown
                        </a>
                        <a class="dropdown-item" href="./dropzone.html"], 
                          Dropzone
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        <a class="dropdown-item" href="./lightbox.html"], 
                          Lightbox
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        <a class="dropdown-item" href="./tinymce.html"], 
                          TinyMCE
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        <a class="dropdown-item" href="./inline-player.html"], 
                          Inline player
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        H5Div(["dropend"], 
                          <a class="dropdown-item dropdown-toggle" href="#sidebar-authentication" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false"], 
                            Authentication
                          </a>
                          H5Div(["dropdown-menu"], 
                            H5A( href="./sign-in.html" class="dropdown-item"], 
                              Sign in
                            </a>
                            H5A( href="./sign-in-illustration.html" class="dropdown-item"], 
                              Sign in with illustration
                            </a>
                            H5A( href="./sign-in-cover.html" class="dropdown-item"], 
                              Sign in with cover
                            </a>
                            H5A( href="./sign-up.html" class="dropdown-item"], 
                              Sign up
                            </a>
                            H5A( href="./forgot-password.html" class="dropdown-item"], 
                              Forgot password
                            </a>
                            H5A( href="./terms-of-service.html" class="dropdown-item"], 
                              Terms of service
                            </a>
                            H5A( href="./auth-lock.html" class="dropdown-item"], 
                              Lock screen
                            )
                          )
                        </div>
                        H5Div(["dropend"], 
                          <a class="dropdown-item dropdown-toggle" href="#sidebar-error" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false"], 
                            tablerIcon("file-minus -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-inline me-1" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><path d="M14 3v4a1 1 0 0 0 1 1h4"], </path><path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z"], </path><line x1="9" y1="14" x2="15" y2="14"], </line></svg>
                            Error pages
                          </a>
                          H5Div(["dropdown-menu"], 
                            H5A( href="./error-404.html" class="dropdown-item"], 
                              404 page
                            </a>
                            H5A( href="./error-500.html" class="dropdown-item"], 
                              500 page
                            </a>
                            H5A( href="./error-maintenance.html" class="dropdown-item"], 
                              Maintenance page
                            )
                          )
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="nav-item"], 
                  <a class="nav-link" href="./form-elements.html"], 
                    <span class="nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("checkbox -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><polyline points="9 11 12 14 20 6"], </polyline><path d="M20 12v6a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h9"], </path></svg>
                    </span>
                    <span class="nav-link-title"], 
                      Form elements
                    </span>
                  </a>
                </li>
                <li class="nav-item dropdown"], 
                  <a class="nav-link dropdown-toggle" href="#navbar-extra" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false"], 
                    <span class="nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("star -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z"], </path></svg>
                    </span>
                    <span class="nav-link-title"], 
                      Extra
                    </span>
                  </a>
                  H5Div(["dropdown-menu"], 
                    H5Div(["dropdown-menu-columns"], 
                      H5Div(["dropdown-menu-column"], 
                        <a class="dropdown-item" href="./activity.html"], 
                          Activity
                        </a>
                        <a class="dropdown-item" href="./gallery.html"], 
                          Gallery
                        </a>
                        <a class="dropdown-item" href="./invoice.html"], 
                          Invoice
                        </a>
                        <a class="dropdown-item" href="./search-results.html"], 
                          Search results
                        </a>
                        <a class="dropdown-item" href="./pricing.html"], 
                          Pricing cards
                        </a>
                        <a class="dropdown-item" href="./pricing-table.html"], 
                          Pricing table
                        </a>
                        <a class="dropdown-item" href="./faq.html"], 
                          FAQ
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        <a class="dropdown-item" href="./users.html"], 
                          Users
                        </a>
                        <a class="dropdown-item" href="./license.html"], 
                          License
                        </a>
                      </div>
                      H5Div(["dropdown-menu-column"], 
                        <a class="dropdown-item" href="./logs.html"], 
                          Logs
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        <a class="dropdown-item" href="./music.html"], 
                          Music
                        </a>
                        <a class="dropdown-item" href="./tasks.html"], 
                          Tasks
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        <a class="dropdown-item" href="./uptime.html"], 
                          Uptime monitor
                        </a>
                        <a class="dropdown-item" href="./widgets.html"], 
                          Widgets
                        </a>
                        <a class="dropdown-item" href="./wizard.html"], 
                          Wizard
                        </a>
                        <a class="dropdown-item" href="./settings.html"], 
                          Settings
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        <a class="dropdown-item" href="./job-listing.html"], 
                          Job listing
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="nav-item dropdown"], 
                  <a class="nav-link dropdown-toggle" href="#navbar-layout" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false"], 
                    <span class="nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("layout-2 -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><rect x="4" y="4" width="6" height="5" rx="2"], </rect><rect x="4" y="13" width="6" height="7" rx="2"], </rect><rect x="14" y="4" width="6" height="7" rx="2"], </rect><rect x="14" y="15" width="6" height="5" rx="2"], </rect></svg>
                    </span>
                    <span class="nav-link-title"], 
                      Layout
                    </span>
                  </a>
                  H5Div(["dropdown-menu"], 
                    H5Div(["dropdown-menu-columns"], 
                      H5Div(["dropdown-menu-column"], 
                        <a class="dropdown-item" href="./layout-horizontal.html"], 
                          Horizontal
                        </a>
                        <a class="dropdown-item" href="./layout-boxed.html"], 
                          Boxed
                          <span class="badge badge-sm bg-green text-uppercase ms-2"], New</span>
                        </a>
                        <a class="dropdown-item" href="./layout-vertical.html"], 
                          Vertical
                        </a>
                        <a class="dropdown-item" href="./layout-vertical-transparent.html"], 
                          Vertical transparent
                        </a>
                        <a class="dropdown-item" href="./layout-vertical-right.html"], 
                          Right vertical
                        </a>
                        <a class="dropdown-item" href="./layout-condensed.html"], 
                          Condensed
                        </a>
                        <a class="dropdown-item" href="./layout-combo.html"], 
                          Combined
                        </a>
                      </div>
                      H5Div(["dropdown-menu-column"], 
                        <a class="dropdown-item" href="./layout-navbar-dark.html"], 
                          Navbar dark
                        </a>
                        <a class="dropdown-item" href="./layout-navbar-sticky.html"], 
                          Navbar sticky
                        </a>
                        <a class="dropdown-item" href="./layout-navbar-overlap.html"], 
                          Navbar overlap
                        </a>
                        <a class="dropdown-item" href="./layout-rtl.html"], 
                          RTL mode
                        </a>
                        <a class="dropdown-item" href="./layout-fluid.html"], 
                          Fluid
                        </a>
                        <a class="dropdown-item" href="./layout-fluid-vertical.html"], 
                          Fluid vertical
                        </a>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="nav-item"], 
                  <a class="nav-link" href="./icons.html"], 
                    <span class="nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("ghost -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><path d="M5 11a7 7 0 0 1 14 0v7a1.78 1.78 0 0 1 -3.1 1.4a1.65 1.65 0 0 0 -2.6 0a1.65 1.65 0 0 1 -2.6 0a1.65 1.65 0 0 0 -2.6 0a1.78 1.78 0 0 1 -3.1 -1.4v-7"], </path><line x1="10" y1="10" x2="10.01" y2="10"], </line><line x1="14" y1="10" x2="14.01" y2="10"], </line><path d="M10 14a3.5 3.5 0 0 0 4 0"], </path></svg>
                    </span>
                    <span class="nav-link-title"], 
                      2681 icons
                    </span>
                  </a>
                </li>
                <li class="nav-item dropdown"], 
                  <a class="nav-link dropdown-toggle" href="#navbar-help" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false"], 
                    <span class="nav-link-icon d-md-none d-lg-inline-block"], tablerIcon("lifebuoy -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><circle cx="12" cy="12" r="4"], </circle><circle cx="12" cy="12" r="9"], </circle><line x1="15" y1="15" x2="18.35" y2="18.35"], </line><line x1="9" y1="15" x2="5.65" y2="18.35"], </line><line x1="5.65" y1="5.65" x2="9" y2="9"], </line><line x1="18.35" y1="5.65" x2="15" y2="9"], </line></svg>
                    </span>
                    <span class="nav-link-title"], 
                      Help
                    </span>
                  </a>
                  H5Div(["dropdown-menu"], 
                    <a class="dropdown-item" href="./docs/index.html"], 
                      Documentation
                    </a>
                    <a class="dropdown-item" href="./changelog.html"], 
                      Changelog
                    </a>
                    <a class="dropdown-item" href="https://github.com/tabler/tabler" target="_blank" rel="noopener"], 
                      Source code
                    </a>
                    <a class="dropdown-item text-pink" href="https://github.com/sponsors/codecalm" target="_blank" rel="noopener"], 
                      tablerIcon("heart -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-inline me-1" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><path d="M19.5 12.572l-7.5 7.428l-7.5 -7.428m0 0a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572"], </path></svg>
                      Sponsor project!
                    </a>
                  </div>
                </li>
              </ul>
              H5Div(["my-2 my-md-0 flex-grow-1 flex-md-grow-0 order-first order-md-last"], 
                <form action="./" method="get" autocomplete="off" novalidate=""], 
                  H5Div(["input-icon"], 
                    <span class="input-icon-addon"], 
                      tablerIcon("search -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><circle cx="10" cy="10" r="7"], </circle><line x1="21" y1="21" x2="15" y2="15"], </line></svg>
                    </span>
                    <input type="text" value="" class="form-control" placeholder="Search…" aria-label="Search in website"], 
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      H5Div(["page-wrapper"], 
        <!-- Page header -->
        H5Div(["page-header d-print-none"], 
          H5Div(["container-xl"], 
            H5Div(["row g-2 align-items-center"], 
              H5Div(["col"], 
                <h2 class="page-title"], 
                  Empty page
                </h2>
              </div>
            </div>
          </div>
        </div>
        <!-- Page body -->
        H5Div(["page-body"], 
          H5Div(["container-xl"], 
            <!-- Content here -->
          </div>
        </div>
        <footer class="footer footer-transparent d-print-none"], 
          H5Div(["container-xl"], 
            H5Div(["row text-center align-items-center flex-row-reverse"], 
              H5Div(["col-lg-auto ms-lg-auto"], 
                <ul class="list-inline list-inline-dots mb-0"], 
                  <li class="list-inline-item"], H5A( href="./docs/index.html" class="link-secondary"], Documentation</a></li>
                  <li class="list-inline-item"], H5A( href="./license.html" class="link-secondary"], License</a></li>
                  <li class="list-inline-item"], H5A( href="https://github.com/tabler/tabler" target="_blank" class="link-secondary" rel="noopener"], Source code</a></li>
                  <li class="list-inline-item"], 
                    H5A( href="https://github.com/sponsors/codecalm" target="_blank" class="link-secondary" rel="noopener"], 
                      tablerIcon("heart -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon text-pink icon-filled icon-inline" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><path d="M19.5 12.572l-7.5 7.428l-7.5 -7.428m0 0a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572"], </path></svg>
                      Sponsor
                    </a>
                  </li>
                </ul>
              </div>
              H5Div(["col-12 col-lg-auto mt-3 mt-lg-0"], 
                <ul class="list-inline list-inline-dots mb-0"], 
                  <li class="list-inline-item"], 
                    Copyright © 2022
                    H5A( href="." class="link-secondary"], Tabler</a>.
                    All rights reserved.
                  </li>
                  <li class="list-inline-item"], 
                    Generated 2022-09-24 09:54 UTC
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>