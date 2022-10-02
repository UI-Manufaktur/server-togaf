module servers.togaf.controllers.pages.abbs.read;

@safe:
import servers.togaf;

class DTGFAbbReadPageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFAbbReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFAbbReadView(this));
  }
}
mixin(MVCControllerCalls!("TGFAbbReadPageController", "DTGFAbbReadPageController"));
