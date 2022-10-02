module servers.togaf.controllers.pages.abbs.update;

@safe:
import servers.togaf;

class DTGFAbbUpdatePageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFAbbUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFAbbUpdateView(this));
  }
}
mixin(MVCControllerCalls!("TGFAbbUpdatePageController", "DTGFAbbUpdatePageController"));
