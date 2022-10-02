module servers.togaf.controllers.actions.gbbs.create;

@safe:
import servers.togaf;

class DTGFGbbCreateActionController : DMVCActionController {
  mixin(MVCControllerThis!("TGFGbbCreateActionController"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCControllerCalls!("TGFGbbCreateActionController", "DTGFGbbCreateActionController"));
