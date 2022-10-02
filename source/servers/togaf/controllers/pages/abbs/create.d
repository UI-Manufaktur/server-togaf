module servers.togaf.controllers.pages.abbs.create;

@safe:
import servers.togaf;

class DTGFAbbCreatePageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFAbbCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFAbbCreateView(this));
  }
}
mixin(MVCControllerCalls!("TGFAbbCreatePageController", "DTGFAbbCreatePageController"));
