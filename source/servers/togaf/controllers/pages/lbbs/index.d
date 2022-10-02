module servers.togaf.controllers.pages.lbbs.index;

@safe:
import servers.togaf;

class DTGFLbbIndexPageController : DMVCPageController {
  mixin(MVCControllerThis!("TGFLbbIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(TGFLbbIndexView(this));
  }
}
mixin(MVCControllerCalls!("TGFLbbIndexPageController", "DTGFLbbIndexPageController"));
