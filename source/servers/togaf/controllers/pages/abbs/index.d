module servers.togaf.controllers.pages.abbs.index;

@safe:
import servers.togaf;

class DTGFAbbIndexPageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFAbbIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFAbbIndexView(this));
  }
}
mixin(MVCControllerCalls!("TGFAbbIndexPageController", "DTGFAbbIndexPageController"));
