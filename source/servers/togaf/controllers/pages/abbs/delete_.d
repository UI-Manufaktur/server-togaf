module servers.togaf.controllers.pages.abbs.delete_;

@safe:
import servers.togaf;

class DTGFAbbDeletePageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFAbbDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFAbbDeleteView(this));
  }
}
mixin(MVCControllerCalls!("TGFAbbDeletePageController", "DTGFAbbDeletePageController"));
