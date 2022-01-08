#!/usr/bin/env node

import { Command } from 'commander';
const program = new Command();

program
  .command('clean')
  .description('clean system residual packages dependencies')
  .action(() => {
    console.log('cleaned')
  });

program
  .command('download')
  .description('download the given binary package into the current directory')
  .action(() => {
    console.log('downloaded')
  });

program
  .command('fix')
  .description('fix system issues')
  .action(() => {
    console.log('downloaded')
  });

program
  .command('info')
  .description('view info about a specific package')
  .action(() => {
    console.log('downloaded')
  });

program
  .command('install')
  .description('Install a Package from Repositories')
  .action(() => {
    console.log('downloaded')
  });


program
  .command('installed')
  .description('list installed packages')
  .action(() => {
    console.log('downloaded')
  });

program
  .command('remove')
  .description('remove one or more installed packages')
  .action(() => {
    console.log('downloaded')
  });


program
  .command('search <package>')
  .description('find a package package')
  // .action((package) => {
  //   console.log(package)
  // })
  ;

program
  .command('update')
  .description('update package lists')
  .action(() => {
    console.log('downloaded')
  });

program
  .command('upgrade')
  .description('upgrade installed packages')
  .action(() => {

  });

import System from '../src/system.js';
program
  .command('system')
  .description('list system information')
  .action(() => {
    let system = new System('apt')
    console.log(`manager: ${system.executable()}`)
    console.log(`location: ${system.location()}`)
  });

program
  .command('version')
  .description('package version')
  .action(() => {
    console.log('version: 0.0.1')
  });

program.parse(process.argv);
