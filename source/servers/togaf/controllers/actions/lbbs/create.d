module servers.togaf.controllers.actions.lbbs.create;

@safe:
import servers.togaf;

class DTGFLbbCreateActionController : DMVCActionController {
  mixin(MVCControllerThis!("TGFLbbCreateActionController"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCControllerCalls!("TGFLbbCreateActionController", "DTGFLbbCreateActionController"));
