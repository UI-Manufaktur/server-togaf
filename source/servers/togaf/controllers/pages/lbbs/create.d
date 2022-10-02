module servers.togaf.controllers.pages.lbbs.create;

@safe:
import servers.togaf;

class DTGFLbbCreatePageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFLbbCreatePageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFLbbCreateView(this));
  }
}
mixin(MVCControllerCalls!("TGFLbbCreatePageController", "DTGFLbbCreatePageController"));
